import '../../utils/pagination.dart';
import '../entities/enums.dart';

/// Parameters for retrieving a list of models.
class GetModelsParams extends PaginationParams {
  /// Filter by model ID.
  final int? id;

  /// Filter by creator username.
  final String? username;

  /// Include NSFW content.
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
  });

  @override
  Map<String, dynamic> toQueryParameters() {
    final params = super.toQueryParameters();

    if (id != null) params['id'] = id;
    if (username != null) params['username'] = username;
    if (nsfw != null) params['nsfw'] = nsfw;
    if (primaryFileOnly != null) params['primaryFileOnly'] = primaryFileOnly;
    if (favorites != null) params['favorites'] = favorites;
    if (hidden != null) params['hidden'] = hidden;

    if (types != null && types!.isNotEmpty) {
      params['types'] = types!.map((t) => t.toJson()).join(',');
    }

    if (baseModels != null && baseModels!.isNotEmpty) {
      params['baseModels'] = baseModels!.map((bm) => bm.toJson()).join(',');
    }

    if (sort != null) params['sort'] = sort!.toJson();
    if (period != null) params['period'] = period!.toJson();

    if (tags != null && tags!.isNotEmpty) {
      params['tags'] = tags!.join(',');
    }

    if (browsingLevel != null) params['browsingLevel'] = browsingLevel;
    if (earlyAccess != null) params['earlyAccess'] = earlyAccess;
    if (query != null) params['query'] = query;

    return params;
  }
}
