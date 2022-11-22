// HolocallsToAudiocalls, Cyberpunk 2077 mod that turn holocalls to audiocalls
// Copyright (C) 2022 BurgersMcFly

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

@replaceMethod(HudPhoneGameController)

  public final func SetPhoneFunction(newFunction: EHudPhoneFunction) -> Void {
    if NotEquals(this.m_CurrentFunction, newFunction) {
      this.m_CurrentFunction = newFunction;
      switch newFunction {
        case EHudPhoneFunction.DisplayingMessage:
          break;
        case EHudPhoneFunction.IncomingCall:
          this.m_AvatarController.ShowIncomingContact(this.m_CurrentPhoneCallContact);
          break;
        case EHudPhoneFunction.Audiocall:
          this.m_AvatarController.StartAudiocall(this.m_CurrentPhoneCallContact);
          break;
        case EHudPhoneFunction.Holocall:
          this.m_AvatarController.StartAudiocall(this.m_CurrentPhoneCallContact);
          this.m_AvatarController.ShowIncomingContact(this.m_CurrentPhoneCallContact);
      };
      if Equals(newFunction, EHudPhoneFunction.Inactive) {
        this.m_AvatarController.ShowEndCallContact(this.m_CurrentPhoneCallContact);
        this.m_RootWidget.SetVisible(false);
        inkWidgetRef.SetVisible(this.m_Holder, false);
      };
    };
  }

  