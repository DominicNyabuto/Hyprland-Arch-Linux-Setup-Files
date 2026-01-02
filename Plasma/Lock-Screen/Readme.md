# Context

The 'lockscreen' folder is a copy-paste from /usr/share/plasma/shells/org.kde.plasma.desktop/contents/lockscreen/

its contents are in the root folder as seen in the /usr/ directory and can be changed if KDE is updated.

To ensure the changes remain i transferred the files here to keep a copy that I can just paste back when an update breaks it. 





# Failed themefying attempt 

Gemini Pro recommended this but i tried it and it failed:


## SilentLocker - Local Global Theme

To save your work permanently so that system updates (which overwrite /usr/share/) do not destroy your customization, you must move your modified files into a Local Global Theme in your home directory.

Here is the exact process to "freeze" your current setup into a custom theme called "SilentLocker".

### Step 1: Create the Local Directory

Open your terminal and run this command to create the correct folder structure in your home directory (where updates can't touch it):
Bash

mkdir -p ~/.local/share/plasma/look-and-feel/SilentLocker/contents/lockscreen/

### Step 2: Copy Your Modified Files

Since you have already edited the files in /usr/share/..., you just need to copy those specific modified files to your new local folder:
Bash

cp -r /usr/share/plasma/shells/org.kde.plasma.desktop/contents/lockscreen/* ~/.local/share/plasma/look-and-feel/SilentLocker/contents/lockscreen/

### Step 3: Create the Identity File (Crucial)

KDE will not see this new folder in the settings menu unless it has a metadata.json file.

    Create the file:
    Bash

nano ~/.local/share/plasma/look-and-feel/SilentLocker/metadata.json

Paste this exact content into it:
JSON

    {
        "KPlugin": {
            "Id": "SilentLocker",
            "Name": "SilentLocker",
            "Description": "Custom Black Adwaita Lock Screen",
            "ServiceTypes": [
                "Plasma/LookAndFeel"
            ],
            "Version": "1.0",
            "Website": ""
        },
        "KPackageStructure": "Plasma/LookAndFeel"
    }

    Save and exit (Ctrl+O, Enter, Ctrl+X).

### Step 4: Activate Your New Theme

Now that the files are safe in your home folder, you need to tell KDE to use this version instead of the system default.

    Open System Settings.

    Go to Colors & Themes > Global Theme.

        Note: In some versions, you might need to check "Login Screen (SDDM)" or look for a specific "Lock Screen" dropdown if available, but usually, it appears here.

    Select SilentLocker and click Apply.

If SilentLocker does not appear in the Global Theme list: It might be hidden because it only contains a lock screen and not a full desktop theme. In that case, force the lock screen setting via command line:
Bash

kwriteconfig6 --file kscreenlockerrc --group Greeter --group Theme --key LookAndFeelPackage "SilentLocker"

(Use kwriteconfig5 if you are on an older version of Plasma).

### Step 5: Verify

Run the test command pointing specifically to your new local theme to make sure it loads correctly:
Bash

/usr/lib/kscreenlocker_greet --testing --theme SilentLocker

Now, when Arch Linux updates the plasma-desktop package, it will overwrite the files in /usr/share/, but your lock screen will ignore those and use the SilentLocker files in your home folder instead.
