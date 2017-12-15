#include "skse/PluginAPI.h"
#include "skse/PapyrusArgs.h"
#include "skse/PapyrusClass.h"
#include "skse/PapyrusVM.h"
#include "skse/PapyrusNativeFunctions.h"

#include "skse/GameData.h"
#include "skse/GameTypes.h"
#include "skse/GameForms.h"
#include "skse/GameRTTI.h"
#include "skse/GameReferences.h"
#include "skse/GameObjects.h"
#include "skse/GameBSExtraData.h"

#include <string> 
#include <math.h>

namespace DeviousDevices {
  //float TestCos(StaticFunctionTag* base, float val);
  TESForm* FindMatchingDevice(StaticFunctionTag* base, Actor* obj, BGSKeyword* kwd);
  bool RegisterFuncs(VMClassRegistry* registry);
}
