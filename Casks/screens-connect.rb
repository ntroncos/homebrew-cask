cask 'screens-connect' do
  version '4.8.6100,1551210912'
  sha256 'bcfbb10e988288661cdd6cbd7c6c51527284c3202b559d5ddf7e225fd8df7872'

  # dl.devmate.com/com.edovia.Screens-Connect was verified as official when first introduced to the cask
  url "https://dl.devmate.com/com.edovia.Screens-Connect/#{version.patch}/#{version.after_comma}/ScreensConnect-#{version.patch}.zip"
  appcast 'https://updates.devmate.com/com.edovia.Screens-Connect.xml'
  name 'Screens Connect'
  homepage 'https://screensconnect.com/'

  depends_on macos: '>= :el_capitan'

  app 'Screens Connect.app'

  # Uninstall script can fail when trying to remove legacy PKGIDS
  # Original discussion: https://github.com/Homebrew/homebrew-cask/pull/8833
  uninstall quit:      'com.edovia.Screens-Connect',
            launchctl: [
                         'com.edovia.Screens-Connect.launcher',
                         'com.edovia.screens.connect',
                       ],
            script:    {
                         executable:   "#{appdir}/Screens Connect.app/Contents/Resources/sc-uninstaller.tool",
                         must_succeed: false,
                         sudo:         true,
                       }

  zap trash: [
               '~/Library/Preferences/com.edovia.Screens-Connect.plist',
               '~/Library/Preferences/com.edovia.ScreensConnect.Shared.plist',
             ]
end
