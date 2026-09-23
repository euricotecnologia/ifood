unit UIFoodRecord;

interface

uses
  SysUtils, Classes;

type

  TIFoodRecord = packed record

    AdditionalFees_value: currency;

    Benefits_value: currency;
    Benefits_target: string;
    Benefits_sponsorship_name: string;
    Benefits_sponsorship_value: currency;

    Cliente_documentNumber: string;
    Cliente_id: string;
    Cliente_name: string;
    Cliente_ordersCountOnRestaurant: string;
    Cliente_phone: string;
    Cliente_phone_localizer: string;
    Cliente_uuid: string;

    Endereco_city: string;
    Endereco_complement: string;
    Endereco_country: string;
    Endereco_formattedAddress: string;
    Endereco_latitude: string;
    Endereco_longitude: string;
    Endereco_neighborhood: string;
    Endereco_postalCode: string;
    Endereco_observations: string;
    Endereco_reference: string;
    Endereco_state: string;
    Endereco_streetName: string;
    Endereco_streetNumber: string;

    Indoor_mode: string;
    Indoor_table: string;

    Mercant_city: string;
    Mercant_country: string;
    Mercant_formatted: string;
    Mercant_name: string;
    Mercant_neighborhood: string;
    Mercant_postalCode: string;
    Mercant_shortId: string;
    Mercant_state: string;
    Mercant_streetName: string;
    Mercant_streetNumber: string;

    Payments_changeFor: string;
    Payments_methods: string;
    Payments_method: string;
    Payments_name: string;
    Payments_prepaid: string;
    Payments_type: string;
    Payments_value: string;

    Pedido_createdAt: string;
    Pedido_deliveryFee: string;
    Pedido_deliveryDateTime: string;
    Pedido_deliveryDateTimeStart: string;
    Pedido_deliveryDateTimeEnd: string;
    Pedido_id: string;
    Pedido_items: string;
    Pedido_orderTiming: string;
    Pedido_reference: string;
    Pedido_shortReference: string;
    Pedido_subTotal: string;
    Pedido_totalPrice: string;


    Produto_discount: string;
    Produto_externalCode: string;
    Produto_name: string;
    Produto_observations: string;
    Produto_price: string;
    Produto_quantity: string;
    Produto_totalPrice: string;


    SubProduto_discount: string;
    SubProduto_externalCode: string;
    SubProduto_quantity: string;
    SubProduto_name: string;
    SubProduto_observations: string;
    SubProduto_price: string;
    SubProduto_totalPrice: string;


    procedure Clear;
  end;

implementation

{ TIFoodRecord }

procedure TIFoodRecord.Clear;
begin
  //ALiquotaFederal      := 0.00;
  //AliquotaEstadual     := 0.00;
  //neighborhood         := EmptyStr;
end;

end.

