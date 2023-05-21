class PokemomonSpeciesInfoResponse {
  final String description;

  PokemomonSpeciesInfoResponse({required this.description});

  factory PokemomonSpeciesInfoResponse.fromJson(Map<String, dynamic> json) {
    String flavorText = json['flavor_text_entries'][0]['flavor_text'];
    flavorText = flavorText.replaceAll('\n', ' ');

    return PokemomonSpeciesInfoResponse(description: flavorText);
  }
}
