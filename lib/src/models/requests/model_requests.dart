import '../../utils/pagination.dart';
import '../entities/enums.dart';

/// Parameters for retrieving a list of models.
class GetModelsParams extends PaginationParams {
  /// Filter by model ID.
  final int? id;

  /// Filter by creator username.
  final String? username;

  /// Filter by NSFW level.
  final bool? nsfw;

  /// Only include primary files.
  final bool? primaryFileOnly;

  /// Filter by user favorites. Requires authentication.
  final bool? favorites;

  /// Include hidden models. Requires authentication.
  final bool? hidden;

  /// Filter by model types.
  final List<ModelType>? types;

  /// Filter by base models.
  final List<BaseModel>? baseModels;

  /// Sort order for results.
  final ModelSort? sort;

  /// Time period for metrics.
  final MetricTimeframe? period;

  /// Filter by tag IDs.
  final List<int>? tags;

  /// Browsing level for filtering NSFW content.
  final int? browsingLevel;

  /// Include early access models.
  final bool? earlyAccess;

  /// Filter by search query.
  final String? query;

  /// Only include models that support on-site generation.
  final bool? supportsGeneration;

  /// Include models with archived status.
  final bool? archived;

  /// Creates parameters for retrieving a list of models.
  const GetModelsParams({
    super.limit,
    super.page,
    super.cursor,
    this.id,
    this.username,
    this.nsfw,
    this.primaryFileOnly,
    this.favorites,
    this.hidden,
    this.types,
    this.baseModels,
    this.sort,
    this.period,
    this.tags,
    this.browsingLevel,
    this.earlyAccess,
    this.query,
    this.supportsGeneration,
    this.archived,
  });

  @override
  Map<String, dynamic> toQueryParameters() {
    final params = super.toQueryParameters();

    if (id != null) params['id'] = id.toString();
    if (username != null) params['username'] = username;
    if (nsfw != null) params['nsfw'] = nsfw!.toString();
    if (primaryFileOnly != null)
      params['primaryFileOnly'] = primaryFileOnly.toString();
    if (favorites != null) params['favorites'] = favorites.toString();
    if (hidden != null) params['hidden'] = hidden.toString();

    if (types != null && types!.isNotEmpty) {
      params['types'] = types!.map((t) => t.toJson()).join(',');
    }

    if (baseModels != null && baseModels!.isNotEmpty) {
      params['baseModels'] = baseModels!.map((bm) => bm.toJson()).join(',');
    }

    if (sort != null) params['sort'] = sort!.toJson();
    if (period != null) params['period'] = period!.toJson();

    if (tags != null && tags!.isNotEmpty) {
      params['tags'] = tags!.map((id) => id.toString()).join(',');
    }

    if (browsingLevel != null)
      params['browsingLevel'] = browsingLevel.toString();
    if (earlyAccess != null) params['earlyAccess'] = earlyAccess.toString();
    if (query != null) params['query'] = query;
    if (supportsGeneration != null)
      params['supportsGeneration'] = supportsGeneration.toString();
    if (archived != null) params['archived'] = archived.toString();

    return params;
  }
}

/// Parameters for retrieving a model by ID.
class GetModelByIdParams {
  /// The ID of the model to retrieve.
  final int id;

  /// Creates parameters for retrieving a model by ID.
  const GetModelByIdParams({
    required this.id,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    return <String, dynamic>{};
  }
}

/// Parameters for retrieving generation details for a model version.
class GetModelVersionGenerationDetailsParams {
  /// The ID of the model version.
  final int id;

  /// The epoch number for training models.
  final int? epoch;

  /// Creates parameters for retrieving generation details.
  const GetModelVersionGenerationDetailsParams({
    required this.id,
    this.epoch,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (epoch != null) params['epoch'] = epoch.toString();

    return params;
  }
}
