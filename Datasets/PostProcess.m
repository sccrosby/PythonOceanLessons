clearvars

ncfiles = dir('*.nc');%'deployment0001_CE07SHSP-SP001-08-CTDPFJ000-recovered_cspp-ctdpf_j_cspp_instrument_recovered_20150409T232516.151000-20150415T022316.566000.nc';


% 1 - 3 - Solid Time Span

t = [];
s = [];
p = [];
tstamp = [];

% Name of output file
nc_out = 'wa_nearshore_SummerFall_2016_ctd.nc';

for nn = 4:5
ncfile = ncfiles(nn).name; %7 - good for downwelling, %3,4 good for upwelling

info = ncinfo(ncfile);
ti = ncread(ncfile,'temperature');
si = ncread(ncfile,'salinity');
pi = ncread(ncfile,'pressure');
tstampi = ncread(ncfile,'profiler_timestamp'); % sec since Jan 1 1970

t = [t; ti];
s = [s; si];
p = [p; pi];
tstamp = [tstamp; tstampi];

end

dn = datenum(1970,1,1,0,0,tstamp);


%% Bin by dep and time
dz = 1;
dep_e = 0:dz:28;
time_e = dn(1):1:dn(end);
time = conv(time_e,[.5 .5],'valid');
dep = conv(dep_e,[.5 .5],'valid');
temperature = NaN(length(dep),length(time));
salinity = NaN(length(dep),length(time));
for dd = 1:length(dep)
    for tt = 1:length(time)
        I = p >= dep_e(dd) & p < dep_e(dd+1) & dn >= time_e(tt) & dn < time_e(tt+1);
        temperature(dd,tt) = mean(t(I));
        salinity(dd,tt) = mean(s(I));
    end
    disp(dd)
end
temperature = temperature';
salinity = salinity';

%% Load in winds
W = load('d:\NDBC\Meteorlogical\CapeElizabeth.mat');
W.dcart = 90-W.wnddir+180;
W.u = W.wndspd_obs.*cosd(W.dcart);
W.v = W.wndspd_obs.*sind(W.dcart);

wndspd = interp1(W.time,conv(W.wndspd_obs,1/24*ones(1,24),'same'),time);
u = interp1(W.time,conv(W.u,1/24*ones(1,24),'same'),time);
v = interp1(W.time,conv(W.v,1/24*ones(1,24),'same'),time);



%% Quick plot

clf
subplot(311)
pcolor(time,dep,temperature')
shading interp
datetick('x','mm/dd/yyyy')
%ch = colorbar;
%ylabel(ch,'Temperature')
title('WA Nearshore CTD')
xlim([time(1) time(end)])

subplot(312)
pcolor(time,dep,salinity')
shading interp
datetick('x','mm/dd/yyyy')
%ch = colorbar;
%ylabel(ch,'Salinity')
xlim([time(1) time(end)])

subplot(313)
plot(time,v)
hold on
plot(time,u)
grid on
printFig(gcf,'wa_nearshore_ctd_2015.png',[7 5],'png')


%% Write out netcdf
Nt = length(time);
Nd = length(dep);

% Create relative time vector (hours)
ref_date = datenum(1970,1,1);
time2 = (time-ref_date)*24;

id = netcdf.create(nc_out,'write');
netcdf.defDim(id,'depth',Nd);
netcdf.defDim(id,'time',Nt);
netcdf.close(id);

nccreate(nc_out,'depth','Dimensions',{'depth'},'Datatype','double')
nccreate(nc_out,'time','Dimensions',{'time'},'Datatype','double')
nccreate(nc_out,'temperature','Dimensions',{'time','depth'},'Datatype','single')
nccreate(nc_out,'salinity','Dimensions',{'time','depth'},'Datatype','single')
nccreate(nc_out,'wind_u','Dimensions',{'time'},'Datatype','single')
nccreate(nc_out,'wind_v','Dimensions',{'time'},'Datatype','single')

ref_date_str = sprintf('hours since %s 00:00:00',datestr(ref_date,'yyyy-mm-dd'));
ncwriteatt(nc_out,'time','units',ref_date_str)
ncwriteatt(nc_out,'time','standard_name','time')

ncwriteatt(nc_out,'depth','units','meters')
ncwriteatt(nc_out,'temperature','units','degrees Celsius')
ncwriteatt(nc_out,'salinity','units','psu')
ncwriteatt(nc_out,'wind_u','units','m/s')
ncwriteatt(nc_out,'wind_v','units','m/s')

% Write variable data
ncwrite(nc_out,'temperature',temperature,[1 1])
ncwrite(nc_out,'salinity',salinity,[1 1])
ncwrite(nc_out,'depth',dep,[1])
ncwrite(nc_out,'wind_u',u,[1])
ncwrite(nc_out,'wind_v',v,[1])
ncwrite(nc_out,'time',time2,[1])


