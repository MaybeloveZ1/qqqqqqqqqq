@echo off
:: ตรวจสอบสิทธิ์ Admin (ถ้ายังไม่ได้รันในฐานะ Administrator จะเด้งขอให้อัตโนมัติ)
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 11111111-1111-1111-1111-111111111111
powercfg -changename 11111111-1111-1111-1111-111111111111 "U18 Ultra Low-Latency Power Profile - Maximum FPS & Zero Throttling"
powercfg -setactive 11111111-1111-1111-1111-111111111111
powercfg -setacvalueindex scheme_current SUB_PROCESSOR IDLEDISABLE 0
powercfg -setacvalueindex scheme_current SUB_PROCESSOR CPMINCORES 100
powercfg -setacvalueindex scheme_current SUB_PROCESSOR CPMAXCORES 100
powercfg -setacvalueindex scheme_current SUB_PROCESSOR CPMINCORES1 100
powercfg -setacvalueindex scheme_current SUB_PROCESSOR CPMAXCORES1 100
powercfg -setacvalueindex scheme_current sub_processor cpmincores 100
powercfg -setacvalueindex scheme_current sub_processor cpmincores1 100
powercfg -setacvalueindex scheme_current SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex scheme_current SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex scheme_current SYSCOOLPOL 1
powercfg -setacvalueindex scheme_current SUB_PCIEXPRESS ASPM 0
powercfg -setacvalueindex scheme_current 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d2d4-4ed4-aec3-a6ad50ba4314 0
powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bea5845c40 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -change monitor-timeout-ac 0
powercfg -change disk-timeout-ac 0
powercfg -change standby-timeout-ac 0
powercfg -change hibernate-timeout-ac 0
powercfg -setactive scheme_current
exit