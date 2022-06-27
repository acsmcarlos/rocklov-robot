clear
rm -rf logs/

robot -d ./logs tests/
# robot -d ./logs tests/equipos/
# robot -d ./logs tests/sessions/
# robot -d ./logs tests/signup/

# robot -d ./logs tests/UserLogin.robot
# robot -d ./logs tests/SignupTests.robot
# robot -d ./logs tests/AttemptLogin.robot
# robot -d ./logs tests/AttemptSignupTests.robot
# robot -d ./logs tests/AddEquiposTests.robot
# robot -d ./logs -i all_equipos tests/GetEquiposTests.robot
# robot -d ./logs tests/DeleteEquiposTests.robot
