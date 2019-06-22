# Contents
- **RdtBase.bflyt**
    - **[L_BgNml/BgNml.bflyt](ResidentMenu-BgNml.bflyt)**: `contains the original light/dark background, but the 'exelixbg' panel too after being injected once`
    - **N_Root**
        - **N_GameRoot**: `contains all items which will be scrolled`
            - **[N_Icon[00-11]/RdtBtnIconGame.bflyt](ResidentMenu-RdtBtnIconGame.bflyt)**: `all 12 game icons which make use of the same layout`
            - **N_Icon_12**
                - **[L_BtnFlc/RdtBtnFullLauncher.bflyt](ResidentMenu-RdtBtnFullLauncher.bflyt)**: `the 13th icon in the gameroot; the 'all apps' button`
        - **N_System**: `contains all six system applets`
            - **[L_BtnNoti/RdtBtnNtf.bflyt](ResidentMenu-RdtBtnNtf.bflyt)**: `the notifications button`
            - **[L_BtnShop/RdtBtnShop.bflyt](ResidentMenu-RdtBtnShop.bflyt)**: `the eshop button`
            - **[L_BtnCtrl/RdtBtnPvr.bflyt](ResidentMenu-RdtBtnPvr.bflyt)**: `the album button`
            - **[L_BtnPvr/RdtBtnCtrl.bflyt](ResidentMenu-RdtBtnCtrl.bflyt)**: `the controllers button`
            - **[L_BtnSet/RdtBtnSet.bflyt](ResidentMenu-RdtBtnSet.bflyt)**: `the settings button`
            - **[L_BtnPow/RdtBtnPow.bflyt](ResidentMenu-RdtBtnPow.bflyt)**: `the power button`
        - **[L_ChildLock/RdtBtnChildLock.bflyt](ResidentMenu-RdtBtnChildLock.bflyt)**: `the childlock button`
        - _N_Balloon_
        - **N_MyPage**
           - **[L_BtnAccount_[00-07]](ResidentMenu-RdtBtnMyPage.bflyt)**: `all usericons which make use of a single layout`
        - **[L_Hud/Hud.bflyt](ResidentMenu-Hud.bflyt)**: `the hud (clock, network, battery)`
        - **[L_BalloonCtrl/RdtBalloonCtrl.bflyt](ResidentMenu-RdtBalloonCtrl.bflyt)**: `the balloon which pops up when (dis)connecting a controller`

# The most important files in ResidentMenu
| Filename | Hypothetical full name |
|------------------------------|---------------------------------|
| [BatteryConsole.bflyt](ResidentMenu-BatteryConsole.bflyt) | BatteryConsole |
| [BgNml.bflyt](ResidentMenu-BgNml.bflyt) | BackgroundNormal |
| [Cursor3.bflyt](ResidentMenu-Cursor3.bflyt) | Cursor3 |
| [GTNumL.bflyt](ResidentMenu-GTNumL.bflyt) | GeneralTimeNumberLarge |
| [GTNumM.bflyt](ResidentMenu-GTNumM.bflyt) | GeneralTimeNumberMedium |
| [Hud.bflyt](ResidentMenu-Hud.bflyt) | Hud |
| [HudBatteryNum.bflyt](ResidentMenu-HudBatteryNum.bflyt) | HudBatteryNumber |
| [HudSignal.bflyt](ResidentMenu-HudSignal.bflyt) | HudSignal |
| [HudTime.bflyt](ResidentMenu-HudTime.bflyt) | HudTime |
| [RdtBalloon.bflyt](ResidentMenu-RdtBalloon.bflyt) | ResidentMenuBalloon |
| [RdtBalloonCtrl.bflyt](ResidentMenu-RdtBalloonCtrl.bflyt) | ResidentMenuBalloonController |
| [RdtBalloonSystemApplet.bflyt](ResidentMenu-RdtBalloonSystemApplet.bflyt) | ResidentMenuBalloonSystemApplet |
| [RdtBase.bflyt](ResidentMenu-RdtBase.bflyt) | ResidentMenuBase |
| [RdtBtnChildLock.bflyt](ResidentMenu-RdtBtnChildLock.bflyt) | ResidentMenuButtonChildLock |
| [RdtBtnCtrl.bflyt](ResidentMenu-RdtBtnCtrl.bflyt) | ResidentMenuButtonController |
| [RdtBtnFullLauncher.bflyt](ResidentMenu-RdtBtnFullLauncher.bflyt) | ResidentMenuButtonFullLauncher |
| [RdtBtnIconGame.bflyt](ResidentMenu-RdtBtnIconGame.bflyt) | ResidentMenuButtonIconGame |
| [RdtBtnMyPage.bflyt](ResidentMenu-RdtBtnMyPage.bflyt) | ResidentMenuButtonMyPage |
| [RdtBtnNtf.bflyt](ResidentMenu-RdtBtnNtf.bflyt) | ResidentMenuButtonNotification |
| [RdtBtnPow.bflyt](ResidentMenu-RdtBtnPow.bflyt) | ResidentMenuButtonPower |
| [RdtBtnPvr.bflyt](ResidentMenu-RdtBtnPvr.bflyt) | ResidentMenuButtonPictureviewer |
| [RdtBtnSet.bflyt](ResidentMenu-RdtBtnSet.bflyt) | ResidentMenuButtonSettings |
| [RdtBtnShop.bflyt](ResidentMenu-RdtBtnShop.bflyt) | ResidentMenuButtonShop |
| [RdtIconPromotion.bflyt](ResidentMenu-RdtIconPromotion.bflyt) | ResidentMenuIconPromotion |