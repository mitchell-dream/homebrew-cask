cask 'soapui' do
  version '5.5.0'
  sha256 'ba04466e07dc0b54aecc9323fd1c638024c25eaca20b790fd14e559e2eec668e'

  # s3.amazonaws.com/downloads.eviware/soapuios was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/downloads.eviware/soapuios/#{version}/SoapUI-#{version}.dmg"
  name 'SmartBear SoapUI'
  homepage 'https://www.soapui.org/'

  installer script: {
                      executable: "SoapUI #{version} Installer.app/Contents/MacOS/JavaApplicationStub",
                      # For future Cask maintainers, if any of these variables
                      # change in future versions from SmartBear, you can run
                      # the installer manually and then check the values in
                      # the following file generated by the installation:
                      #  /Applications/SoapUI-${version}.app/Contents/java/app/.install4j/response.varfile
                      args:       [
                                    '-q', # Unattended mode
                                    '-VcreateDesktopLinkAction$Boolean=false', # Do not create a desktop icon
                                    '-Vsys.component.132$Boolean=true', # Install SoapUI
                                    '-Vsys.component.714$Boolean=false', # Do not install source
                                    '-Vsys.component.1263$Boolean=false', # Do not install HermesJMS
                                    '-Vsys.component.2393$Boolean=false', # Do not install tutorials
                                    '-VshowFileAction$Boolean=false', # Do not show release notes
                                    "-Vsys.installationDir=#{appdir}", # Install to #{appdir} (default: /Applications)
                                    '-VexecutionLauncherAction$Boolean=false', # Do not launch SoapUI after installing
                                  ],
                    }

  uninstall trash: "#{appdir}/SoapUI-#{version}.app"

  zap trash: [
               '~/.soapuios',
               '~/default-soapui-workspace.xml',
               '~/soapui-settings.xml',
             ]
end