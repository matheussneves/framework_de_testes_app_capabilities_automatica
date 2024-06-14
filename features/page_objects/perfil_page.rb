module Perfil
    class Perfil
      attr_accessor :lblperfil, :btnsalvar, :txtname, :txtemail, :txtphone, :txtcbphone, :txtcpf, :txtgenero, :txtdtnasc, :txtcep, :txtestado, :txtcidade, :txtmaior18

        def initialize
          initialize_perfil
        end
  
        def initialize_perfil
          @lblperfil = android? ? 'hands.android.webmotors.debug:id/tvTitle'.type_id : ''.type_id
          @btnsalvar = android? ? 'hands.android.webmotors.debug:id/tvEdit'.type_id : ''.type_id
          @txtname = android? ? 'hands.android.webmotors.debug:id/etName'.type_id : ''.type_id
          @txtemail = android? ? 'hands.android.webmotors.debug:id/etEmail'.type_id : ''.type_id
          @txtphone = android? ? 'hands.android.webmotors.debug:id/etMainPhone'.type_id : ''.type_id
          @txtcbphone = android? ? 'hands.android.webmotors.debug:id/cbShowPhone'.type_id : ''.type_id
          @txtcpf = android? ? 'hands.android.webmotors.debug:id/etCpf'.type_id : ''.type_id
          @txtgenero = android? ? 'hands.android.webmotors.debug:id/tvItem'.type_id : ''.type_id
          @txtdtnasc = android? ? 'hands.android.webmotors.debug:id/etBirthDate'.type_id : ''.type_id
          @txtcep = android? ? 'hands.android.webmotors.debug:id/etCep'.type_id : ''.type_id
          @txtestado = android? ? 'hands.android.webmotors.debug:id/etState'.type_id : ''.type_id
          @txtcidade = android? ? 'hands.android.webmotors.debug:id/etCity'.type_id : ''.type_id
          @txtmaior18 = android? ? 'hands.android.webmotors.debug:id/tv_warning_age'.type_id : ''.type_id
        end

    
    end
end
  
