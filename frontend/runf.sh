clear
rm -rf logs/

robot -d ./Logs Tests/
# robot -d ./Logs Tests/Login.robot
# robot -d ./Logs Tests/EquiposTests.robot
# robot -d ./Logs -i remove Tests/RemoveEquipo.robot
