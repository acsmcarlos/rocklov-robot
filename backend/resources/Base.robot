*** Settings ***
Documentation    Arquivo base

Library    RequestsLibrary
Library    FakerLibrary
Library    libs/mongo.py

Resource    Helpers.robot
Resource    routes/SessionsRoutes.robot
Resource    routes/SignupRoutes.robot
Resource    routes/EquiposRoutes.robot


*** Variables ***
${base_url}    https://rocklov-antonio-api.herokuapp.com
