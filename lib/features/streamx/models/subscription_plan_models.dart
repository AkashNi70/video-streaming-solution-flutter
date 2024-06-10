class SubscriptionPlan {
  final String planId;
  final String planName;
  final String planDuration;
  final String planPrice;
  final String planDeviceLimit;
  final String adsOnOff;
  final String currencyCode;

  SubscriptionPlan({
    required this.planId,
    required this.planName,
    required this.planDuration,
    required this.planPrice,
    required this.planDeviceLimit,
    required this.adsOnOff,
    required this.currencyCode,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      planId: json['plan_id'].toString(),
      planName: json['plan_name'].toString(),
      planDuration: json['plan_duration'].toString(),
      planPrice: json['plan_price'].toString(),
      planDeviceLimit: json['plan_device_limit'].toString(),
      adsOnOff: json['ads_on_off'].toString(),
      currencyCode: json['currency_code'].toString(),
    );
  }
}
