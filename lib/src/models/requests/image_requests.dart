import 'package:civitai_api/civitai_api.dart';

import '../../utils/pagination.dart';
import '../entities/enums.dart';

/// Parameters for retrieving a list of images.
class GetImagesParams extends PaginationParams {
  /// Filter by NSFW level.
  final NsfwLevel? nsfw;

  /// Browsing level for filtering NSFW content.
  final int? browsingLevel;

  /// Filter by tag IDs.
  final List<int>? tags;

  /// Filter by post ID.
  final int? postId;

  /// Filter by model ID.
  final int? modelId;

  /// Filter by model version ID.
  final int? modelVersionId;

  /// Filter by image ID.
  final int? imageId;

  /// Filter by creator username.
  final String? username;

  /// Filter by user ID.
  final int? userId;

  /// Time period for metrics.
  final MetricTimeframe? period;

  /// Sort order for results.
  final ImageSort? sort;

  /// Filter by media type.
  final MediaType? type;

  /// Filter by base models.
  final List<BaseModel>? baseModels;

  /// Include image metadata.
  final bool? withMeta;

  /// Filter by search query.
  final String? query;

  /// Creates parameters for retrieving a list of images.
  const GetImagesParams({
    super.limit,
    super.page,
    super.cursor,
    this.nsfw,
    this.browsingLevel,
    this.tags,
    this.postId,
    this.modelId,
    this.modelVersionId,
    this.imageId,
    this.username,
    this.userId,
    this.period,
    this.sort,
    this.type,
    this.baseModels,
    this.withMeta,
    this.query,
  });

  @override
  Map<String, dynamic> toQueryParameters() {
    final params = super.toQueryParameters();

    // NSFW should be sent as an integer value
    if (nsfw != null) params['nsfw'] = nsfw!.toString();
    if (browsingLevel != null) {
      params['browsingLevel'] = browsingLevel.toString();
    }

    if (tags != null && tags!.isNotEmpty) {
      params['tags'] = tags!.join(',');
    }

    if (postId != null) params['postId'] = postId.toString();
    if (modelId != null) {
      params['modelId'] = modelId.toString();
    }
    if (modelVersionId != null)
      params['modelVersionId'] = modelVersionId.toString();
    if (imageId != null) params['imageId'] = imageId.toString();
    if (username != null) params['username'] = username;
    if (userId != null) params['userId'] = userId.toString();
    if (period != null) params['period'] = period!.toJson();
    if (sort != null) params['sort'] = sort!.toJson();
    if (type != null) params['type'] = type!.toJson();

    if (baseModels != null && baseModels!.isNotEmpty) {
      params['baseModels'] = baseModels!.map((bm) => bm.toJson()).join(',');
    }

    if (withMeta != null) params['withMeta'] = withMeta.toString();
    if (query != null) params['query'] = query;

    return params;
  }
}
