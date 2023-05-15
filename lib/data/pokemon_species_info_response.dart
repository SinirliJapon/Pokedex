class PokemomonSpeciesInfoResponse {
  final String description;

  PokemomonSpeciesInfoResponse({required this.description});

  factory PokemomonSpeciesInfoResponse.fromJson(Map<String, dynamic> json) {
    return PokemomonSpeciesInfoResponse(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}
