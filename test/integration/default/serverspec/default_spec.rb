require 'serverspec'
set :backend, :exec

describe package('unixODBC'), if: os[:family] == 'redhat' do
  it { should be_installed }
end
describe command('odbcinst -q -d -n "ODBC Driver 13 for SQL Server"') do
  its(:exit_status) { should eq 0 }
end
