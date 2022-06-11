//
//  ProfileConstants.swift
//  YogaZone
//
//  Created by Marcus on 09/06/22.
//

import Foundation

enum ProfileConstants: String {
    case collectionName = "UserData"
    case nameField = "name"
    case birthDateField = "birth"
    case stateField = "state"
    case cityField = "city"
    case badCityRequestError = "Error obtaining city data"
    case badStateRequestError = "Error obtaining state data"
    case informNamePlaceholder = "Informe seu nome"
    case informBirthDatePlaceholder = "Informe sua data de nascimento"
    case informCityPlaceholder = "Informe sua Cidade"
    case informStatePlaceholder = "UF"
    case informCurrentPasswordPlaceholder = "Digite sua senha atual"
    case informNewPasswordPlaceholder = "Digite a nova senha"
    case informConfirmNewPasswordPlaceholder = "Confirmar nova senha"
    case informConfirmPasswordPlaceholder = "Digite sua senha"
    case save = "Salvar Alterações"
    case ok = "OK"    
    case atentionWarning = "Atenção"
    case loadingRegionError = "Erro ao carregar dados das regiões. Por favor tente novamente."
}
