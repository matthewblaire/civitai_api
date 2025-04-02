/// Enum representing the different types of models available on CivitAI.
enum ModelType {
  /// Checkpoint model.
  checkpoint,
  
  /// Textual Inversion embedding.
  textualInversion,
  
  /// Hypernetwork.
  hypernetwork,
  
  /// Aesthetic Gradient.
  aestheticGradient,
  
  /// LoRA (Low-Rank Adaptation).
  lora,
  
  /// LoCon (Low-Rank Convolution).
  locon,
  
  /// Controlnet model.
  controlnet,
  
  /// VAE (Variational Auto-Encoder).
  vae,
  
  /// Upscaler.
  upscaler,
  
  /// Motion module.
  motionModule,
  
  /// Pose.
  pose,
  
  /// Wildcards.
  wildcards,
  
  /// Other type of model.
  other;

  /// Converts a string to a ModelType enum value.
  static ModelType fromString(String value) {
    return ModelType.values.firstWhere(
      (e) => e.toString().split('.').last == value.toLowerCase(),
      orElse: () => ModelType.other,
    );
  }

  /// Converts this enum value to a string.
  String toJson() => toString().split('.').last;
}

/// Base model for AI models.
enum BaseModel {
  /// Stable Diffusion 1.4
  sd14,
  
  /// Stable Diffusion 1.5
  sd15,
  
  /// Stable Diffusion 2.0
  sd20,
  
  /// Stable Diffusion 2.1
  sd21,
  
  /// Stable Diffusion XL
  sdxl,
  
  /// Stable Diffusion XL Turbo
  sdxlTurbo,
  
  /// Stable Diffusion XL Lightning
  sdxlLightning,
  
  /// Stable Diffusion 3
  sd3,
  
  /// Other base model
  other;

  /// Converts a string to a BaseModel enum value.
  static BaseModel fromString(String value) {
    switch (value.toLowerCase()) {
      case 'sd 1.4':
      case 'sd1.4':
        return BaseModel.sd14;
      case 'sd 1.5':
      case 'sd1.5':
        return BaseModel.sd15;
      case 'sd 2.0':
      case 'sd2.0':
        return BaseModel.sd20;
      case 'sd 2.1':
      case 'sd2.1':
        return BaseModel.sd21;
      case 'sdxl':
      case 'sd xl':
        return BaseModel.sdxl;
      case 'sdxl turbo':
      case 'sd xl turbo':
        return BaseModel.sdxlTurbo;
      case 'sdxl lightning':
      case 'sd xl lightning':
        return BaseModel.sdxlLightning;
      case 'sd3':
      case 'sd 3':
        return BaseModel.sd3;
      default:
        return BaseModel.other;
    }
  }

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case BaseModel.sd14:
        return 'SD 1.4';
      case BaseModel.sd15:
        return 'SD 1.5';
      case BaseModel.sd20:
        return 'SD 2.0';
      case BaseModel.sd21:
        return 'SD 2.1';
      case BaseModel.sdxl:
        return 'SDXL';
      case BaseModel.sdxlTurbo:
        return 'SDXL Turbo';
      case BaseModel.sdxlLightning:
        return 'SDXL Lightning';
      case BaseModel.sd3:
        return 'SD 3';
      case BaseModel.other:
        return 'Other';
    }
  }
}

/// Sort options for models in listing APIs.
enum ModelSort {
  /// Sort by highest rating.
  highestRated,
  
  /// Sort by most downloaded.
  mostDownloaded,
  
  /// Sort by newest.
  newest,
  
  /// Sort by most liked.
  mostLiked,
  
  /// Sort by most discussed.
  mostDiscussed,
  
  /// Sort by most collected.
  mostCollected;

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// Sort options for images in listing APIs.
enum ImageSort {
  /// Sort by most reactions.
  mostReactions,
  
  /// Sort by newest.
  newest,
  
  /// Sort by oldest.
  oldest;

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// Period options for filtering by time.
enum MetricTimeframe {
  /// All time.
  allTime,
  
  /// Year.
  year,
  
  /// Month.
  month,
  
  /// Week.
  week,
  
  /// Day.
  day;

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// File types for model files.
enum FileType {
  /// Model file.
  model,
  
  /// Pruned model file.
  pruned,
  
  /// Checkpoint file.
  checkpoint,
  
  /// Config file.
  config,
  
  /// VAE file.
  vae,
  
  /// Archive (zip, tar, etc.) file.
  archive,
  
  /// Text file.
  text,
  
  /// Source code file.
  code,
  
  /// Generic training data file.
  trainingData,
  
  /// Example images.
  images,
  
  /// Unknown file type.
  unknown;

  /// Converts a string to a FileType enum value.
  static FileType fromString(String value) {
    return FileType.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => FileType.unknown,
    );
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// NSFW level for content filtering.
enum NsfwLevel {
  /// None - Safe for work.
  none,
  
  /// Soft - Mild suggestive content.
  soft,
  
  /// Mature - Strong suggestive content.
  mature,
  
  /// X - Explicit adult content.
  x,
  
  /// Blocked - Content that violates terms.
  blocked;

  /// Converts a string or number to a NsfwLevel enum value.
  static NsfwLevel fromValue(dynamic value) {
    if (value is String) {
      return NsfwLevel.values.firstWhere(
        (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
        orElse: () => NsfwLevel.none,
      );
    } else if (value is int) {
      return value >= 0 && value < NsfwLevel.values.length
          ? NsfwLevel.values[value]
          : NsfwLevel.none;
    }
    return NsfwLevel.none;
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
  
  /// Converts this enum value to an integer for API requests.
  int toInt() => index;
}

/// Media type for content.
enum MediaType {
  /// Image.
  image,
  
  /// Video.
  video,
  
  /// Animation.
  animation;

  /// Converts a string to a MediaType enum value.
  static MediaType fromString(String value) {
    return MediaType.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => MediaType.image,
    );
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// Model status.
enum ModelStatus {
  /// Published and visible.
  published,
  
  /// Unpublished/draft.
  unpublished,
  
  /// Deleted.
  deleted,
  
  /// TOS violation.
  tosViolation;

  /// Converts a string to a ModelStatus enum value.
  static ModelStatus fromString(String value) {
    return ModelStatus.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => ModelStatus.unpublished,
    );
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// Permission types.
enum PermissionType {
  /// Permission to view/download.
  view,
  
  /// Permission to download.
  download,
  
  /// Permission to use for image generation.
  generate,
  
  /// Permission to use for training.
  train;

  /// Converts a string to a PermissionType enum value.
  static PermissionType fromString(String value) {
    return PermissionType.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => PermissionType.view,
    );
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}

/// Entity types for permissions.
enum EntityType {
  /// Model.
  model,
  
  /// Model version.
  modelVersion,
  
  /// Image.
  image,
  
  /// Post.
  post,
  
  /// Article.
  article,
  
  /// Collection.
  collection;

  /// Converts a string to an EntityType enum value.
  static EntityType fromString(String value) {
    return EntityType.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => EntityType.modelVersion,
    );
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;
}