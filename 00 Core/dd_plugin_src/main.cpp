#include "skse/PluginAPI.h"
#include "skse/skse_version.h"
#include "skse/SafeWrite.h"
#include "DeviousDevices.h"
#include <shlobj.h>

//The log file for all your messages...
IDebugLog	gLog("DDi.log");

PluginHandle	g_pluginHandle = kPluginHandle_Invalid;

// here is a global reference to the interface, keeping to the skse style
SKSESerializationInterface	* g_serialization = NULL;
SKSEPapyrusInterface        * g_papyrus = NULL;

extern "C"
{

  bool SKSEPlugin_Query(const SKSEInterface * skse, PluginInfo * info)
  {
    gLog.OpenRelative(CSIDL_MYDOCUMENTS, "\\My Games\\Skyrim\\SKSE\\DDi.log");
    gLog.SetPrintLevel(IDebugLog::kLevel_Error);
    gLog.SetLogLevel(IDebugLog::kLevel_DebugMessage);
    gLog.SetLogLevel(IDebugLog::kLevel_Message);
    _MESSAGE("DDiUtil");

    // populate info structure
    info->infoVersion =	PluginInfo::kInfoVersion;
    info->name =		"DDiUtil";
    info->version =		1;

    // store plugin handle so we can identify ourselves later
    g_pluginHandle = skse->GetPluginHandle();

    if(skse->isEditor)
      {
	_MESSAGE("loaded in editor, marking as incompatible");

	return false;
      }
    else if(skse->runtimeVersion != RUNTIME_VERSION_1_9_32_0)
      {
	_MESSAGE("unsupported runtime version %08X", skse->runtimeVersion);

	return false;
      }
    g_serialization = (SKSESerializationInterface *)skse->QueryInterface(kInterface_Serialization);
    g_papyrus = (SKSEPapyrusInterface *)skse->QueryInterface(kInterface_Papyrus);
    if(!g_papyrus)
      {
	_MESSAGE("couldn't get papyrus interface");

	return false;
      }

    // ### do not do anything else in this callback
    // ### only fill out PluginInfo and return true/false

    // supported runtime version
    return true;
  }

  bool SKSEPlugin_Load(const SKSEInterface * skse)
  {
    _MESSAGE("load");

    g_serialization->SetUniqueID(g_pluginHandle, 'DDi1');
    // apply patches to the game here
    g_papyrus->Register(DeviousDevices::RegisterFuncs);
    return true;
  }

};
