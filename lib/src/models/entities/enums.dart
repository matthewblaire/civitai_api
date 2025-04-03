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

  /// DoRA model.
  dora,

  /// Controlnet model.
  controlnet,

  /// Upscaler.
  upscaler,

  /// Motion module.
  motionModule,

  /// VAE (Variational Auto-Encoder).
  vae,

  /// Poses.
  poses,

  /// Wildcards.
  wildcards,

  /// Workflows.
  workflows,

  /// Detection.
  detection,

  /// Other type of model.
  other;

  /// Converts a string to a ModelType enum value.
  static ModelType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'checkpoint':
        return ModelType.checkpoint;
      case 'textualinversion':
        return ModelType.textualInversion;
      case 'hypernetwork':
        return ModelType.hypernetwork;
      case 'aestheticgradient':
        return ModelType.aestheticGradient;
      case 'lora':
        return ModelType.lora;
      case 'locon':
        return ModelType.locon;
      case 'dora':
        return ModelType.dora;
      case 'controlnet':
        return ModelType.controlnet;
      case 'upscaler':
        return ModelType.upscaler;
      case 'motionmodule':
        return ModelType.motionModule;
      case 'vae':
        return ModelType.vae;
      case 'poses':
        return ModelType.poses;
      case 'wildcards':
        return ModelType.wildcards;
      case 'workflows':
        return ModelType.workflows;
      case 'detection':
        return ModelType.detection;
      default:
        return ModelType.other;
    }
  }

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case ModelType.checkpoint:
        return 'Checkpoint';
      case ModelType.textualInversion:
        return 'TextualInversion';
      case ModelType.hypernetwork:
        return 'Hypernetwork';
      case ModelType.aestheticGradient:
        return 'AestheticGradient';
      case ModelType.lora:
        return 'LORA';
      case ModelType.locon:
        return 'LoCon';
      case ModelType.dora:
        return 'DoRA';
      case ModelType.controlnet:
        return 'Controlnet';
      case ModelType.upscaler:
        return 'Upscaler';
      case ModelType.motionModule:
        return 'MotionModule';
      case ModelType.vae:
        return 'VAE';
      case ModelType.poses:
        return 'Poses';
      case ModelType.wildcards:
        return 'Wildcards';
      case ModelType.workflows:
        return 'Workflows';
      case ModelType.detection:
        return 'Detection';
      case ModelType.other:
        return 'Other';
    }
  }
}

/// Base model for AI models.
enum BaseModel {
  /// Stable Diffusion 1.4
  sd14,

  /// Stable Diffusion 1.5
  sd15,

  /// Stable Diffusion 1.5 LCM
  sd15Lcm,

  /// Stable Diffusion 1.5 Hyper
  sd15Hyper,

  /// Stable Diffusion 2.0
  sd20,

  /// Stable Diffusion 2.0 768
  sd20768,

  /// Stable Diffusion 2.1
  sd21,

  /// Stable Diffusion 2.1 768
  sd21768,

  /// Stable Diffusion 2.1 Unclip
  sd21Unclip,

  /// Stable Diffusion XL 0.9
  sdxl09,

  /// Stable Diffusion XL 1.0
  sdxl10,

  /// Stable Diffusion XL 1.0 LCM
  sdxl10Lcm,

  /// Stable Diffusion XL Distilled
  sdxlDistilled,

  /// Stable Diffusion XL Turbo
  sdxlTurbo,

  /// Stable Diffusion XL Lightning
  sdxlLightning,

  /// Stable Diffusion XL Hyper
  sdxlHyper,

  /// Stable Diffusion 3
  sd3,

  /// Stable Diffusion 3.5
  sd35,

  /// Stable Diffusion 3.5 Medium
  sd35Medium,

  /// Stable Diffusion 3.5 Large
  sd35Large,

  /// Stable Diffusion 3.5 Large Turbo
  sd35LargeTurbo,

  /// Pony
  pony,

  /// Flux.1 S
  flux1S,

  /// Flux.1 D
  flux1D,

  /// AuraFlow
  auraFlow,

  /// Stable Cascade
  stableCascade,

  /// SVD
  svd,

  /// SVD XT
  svdXt,

  /// Playground v2
  playgroundV2,

  /// PixArt a
  pixartA,

  /// PixArt E
  pixartE,

  /// Hunyuan 1
  hunyuan1,

  /// Hunyuan Video
  hunyuanVideo,

  /// Lumina
  lumina,

  /// Kolors
  kolors,

  /// Illustrious
  illustrious,

  /// Mochi
  mochi,

  /// LTXV
  ltxv,

  /// CogVideoX
  cogVideoX,

  /// NoobAI
  noobAI,

  /// Wan Video
  wanVideo,

  /// ODOR
  odor,

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
      case 'sd 1.5 lcm':
      case 'sd1.5 lcm':
        return BaseModel.sd15Lcm;
      case 'sd 1.5 hyper':
      case 'sd1.5 hyper':
        return BaseModel.sd15Hyper;
      case 'sd 2.0':
      case 'sd2.0':
        return BaseModel.sd20;
      case 'sd 2.0 768':
        return BaseModel.sd20768;
      case 'sd 2.1':
      case 'sd2.1':
        return BaseModel.sd21;
      case 'sd 2.1 768':
        return BaseModel.sd21768;
      case 'sd 2.1 unclip':
        return BaseModel.sd21Unclip;
      case 'sdxl 0.9':
        return BaseModel.sdxl09;
      case 'sdxl':
      case 'sd xl':
      case 'sdxl 1.0':
        return BaseModel.sdxl10;
      case 'sdxl 1.0 lcm':
        return BaseModel.sdxl10Lcm;
      case 'sdxl distilled':
        return BaseModel.sdxlDistilled;
      case 'sdxl turbo':
      case 'sd xl turbo':
        return BaseModel.sdxlTurbo;
      case 'sdxl lightning':
      case 'sd xl lightning':
        return BaseModel.sdxlLightning;
      case 'sdxl hyper':
        return BaseModel.sdxlHyper;
      case 'sd3':
      case 'sd 3':
        return BaseModel.sd3;
      case 'sd 3.5':
        return BaseModel.sd35;
      case 'sd 3.5 medium':
        return BaseModel.sd35Medium;
      case 'sd 3.5 large':
        return BaseModel.sd35Large;
      case 'sd 3.5 large turbo':
        return BaseModel.sd35LargeTurbo;
      case 'pony':
        return BaseModel.pony;
      case 'flux.1 s':
        return BaseModel.flux1S;
      case 'flux.1 d':
        return BaseModel.flux1D;
      case 'auraflow':
        return BaseModel.auraFlow;
      case 'stable cascade':
        return BaseModel.stableCascade;
      case 'svd':
        return BaseModel.svd;
      case 'svd xt':
        return BaseModel.svdXt;
      case 'playground v2':
        return BaseModel.playgroundV2;
      case 'pixart a':
        return BaseModel.pixartA;
      case 'pixart e':
        return BaseModel.pixartE;
      case 'hunyuan 1':
        return BaseModel.hunyuan1;
      case 'hunyuan video':
        return BaseModel.hunyuanVideo;
      case 'lumina':
        return BaseModel.lumina;
      case 'kolors':
        return BaseModel.kolors;
      case 'illustrious':
        return BaseModel.illustrious;
      case 'mochi':
        return BaseModel.mochi;
      case 'ltxv':
        return BaseModel.ltxv;
      case 'cogvideox':
        return BaseModel.cogVideoX;
      case 'noobai':
        return BaseModel.noobAI;
      case 'wan video':
        return BaseModel.wanVideo;
      case 'odor':
        return BaseModel.odor;
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
      case BaseModel.sd15Lcm:
        return 'SD 1.5 LCM';
      case BaseModel.sd15Hyper:
        return 'SD 1.5 Hyper';
      case BaseModel.sd20:
        return 'SD 2.0';
      case BaseModel.sd20768:
        return 'SD 2.0 768';
      case BaseModel.sd21:
        return 'SD 2.1';
      case BaseModel.sd21768:
        return 'SD 2.1 768';
      case BaseModel.sd21Unclip:
        return 'SD 2.1 Unclip';
      case BaseModel.sdxl09:
        return 'SDXL 0.9';
      case BaseModel.sdxl10:
        return 'SDXL 1.0';
      case BaseModel.sdxl10Lcm:
        return 'SDXL 1.0 LCM';
      case BaseModel.sdxlDistilled:
        return 'SDXL Distilled';
      case BaseModel.sdxlTurbo:
        return 'SDXL Turbo';
      case BaseModel.sdxlLightning:
        return 'SDXL Lightning';
      case BaseModel.sdxlHyper:
        return 'SDXL Hyper';
      case BaseModel.sd3:
        return 'SD 3';
      case BaseModel.sd35:
        return 'SD 3.5';
      case BaseModel.sd35Medium:
        return 'SD 3.5 Medium';
      case BaseModel.sd35Large:
        return 'SD 3.5 Large';
      case BaseModel.sd35LargeTurbo:
        return 'SD 3.5 Large Turbo';
      case BaseModel.pony:
        return 'Pony';
      case BaseModel.flux1S:
        return 'Flux.1 S';
      case BaseModel.flux1D:
        return 'Flux.1 D';
      case BaseModel.auraFlow:
        return 'AuraFlow';
      case BaseModel.stableCascade:
        return 'Stable Cascade';
      case BaseModel.svd:
        return 'SVD';
      case BaseModel.svdXt:
        return 'SVD XT';
      case BaseModel.playgroundV2:
        return 'Playground v2';
      case BaseModel.pixartA:
        return 'PixArt a';
      case BaseModel.pixartE:
        return 'PixArt E';
      case BaseModel.hunyuan1:
        return 'Hunyuan 1';
      case BaseModel.hunyuanVideo:
        return 'Hunyuan Video';
      case BaseModel.lumina:
        return 'Lumina';
      case BaseModel.kolors:
        return 'Kolors';
      case BaseModel.illustrious:
        return 'Illustrious';
      case BaseModel.mochi:
        return 'Mochi';
      case BaseModel.ltxv:
        return 'LTXV';
      case BaseModel.cogVideoX:
        return 'CogVideoX';
      case BaseModel.noobAI:
        return 'NoobAI';
      case BaseModel.wanVideo:
        return 'Wan Video';
      case BaseModel.odor:
        return 'ODOR';
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
  mostCollected,

  /// Sort by oldest.
  oldest,

  /// Sort by most images.
  imageCount;

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case ModelSort.highestRated:
        return 'Highest Rated';
      case ModelSort.mostDownloaded:
        return 'Most Downloaded';
      case ModelSort.newest:
        return 'Newest';
      case ModelSort.oldest:
        return 'Oldest';
      case ModelSort.mostLiked:
        return 'Most Liked';
      case ModelSort.mostDiscussed:
        return 'Most Discussed';
      case ModelSort.mostCollected:
        return 'Most Collected';
      case ModelSort.imageCount:
        return 'Most Images';
    }
  }
}

/// Sort options for images in listing APIs.
enum ImageSort {
  /// Sort by most reactions.
  mostReactions,

  /// Sort by newest.
  newest,

  /// Sort by oldest.
  oldest,

  /// Sort by most comments.
  mostComments,

  /// Sort by most collected.
  mostCollected,

  /// Sort randomly.
  random;

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case ImageSort.mostReactions:
        return 'Most Reactions';
      case ImageSort.mostComments:
        return 'Most Comments';
      case ImageSort.mostCollected:
        return 'Most Collected';
      case ImageSort.newest:
        return 'Newest';
      case ImageSort.oldest:
        return 'Oldest';
      case ImageSort.random:
        return 'Random';
    }
  }
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
  String toJson() {
    switch (this) {
      case MetricTimeframe.allTime:
        return 'AllTime';
      case MetricTimeframe.day:
        return 'Day';
      case MetricTimeframe.week:
        return 'Week';
      case MetricTimeframe.month:
        return 'Month';
      case MetricTimeframe.year:
        return 'Year';
    }
  }
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

  /// Text encoder file.
  textEncoder,

  /// Negative file.
  negative,

  /// Unknown file type.
  unknown;

  /// Converts a string to a FileType enum value.
  static FileType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'model':
        return FileType.model;
      case 'text encoder':
        return FileType.textEncoder;
      case 'pruned model':
        return FileType.pruned;
      case 'negative':
        return FileType.negative;
      case 'checkpoint':
        return FileType.checkpoint;
      case 'config':
        return FileType.config;
      case 'vae':
        return FileType.vae;
      case 'archive':
        return FileType.archive;
      case 'text':
        return FileType.text;
      case 'code':
        return FileType.code;
      case 'training data':
        return FileType.trainingData;
      case 'images':
        return FileType.images;
      default:
        return FileType.unknown;
    }
  }

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case FileType.model:
        return 'Model';
      case FileType.textEncoder:
        return 'Text Encoder';
      case FileType.pruned:
        return 'Pruned Model';
      case FileType.negative:
        return 'Negative';
      case FileType.checkpoint:
        return 'Checkpoint';
      case FileType.config:
        return 'Config';
      case FileType.vae:
        return 'VAE';
      case FileType.archive:
        return 'Archive';
      case FileType.text:
        return 'Text';
      case FileType.code:
        return 'Code';
      case FileType.trainingData:
        return 'Training Data';
      case FileType.images:
        return 'Images';
      case FileType.unknown:
        return 'Unknown';
    }
  }
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

  /// XXX - Extremely explicit adult content.
  xxx,

  /// Blocked - Content that violates terms.
  blocked;

  /// Converts a string or number to a NsfwLevel enum value.
  static NsfwLevel fromValue(dynamic value) {
    if (value is String) {
      return NsfwLevel.values.firstWhere(
        (e) =>
            e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
        orElse: () => NsfwLevel.none,
      );
    } else if (value is int) {
      // Binary flag-based mapping as in the API
      if (value >= 32) return NsfwLevel.blocked;
      if (value >= 16) return NsfwLevel.xxx;
      if (value >= 8) return NsfwLevel.x;
      if (value >= 4) return NsfwLevel.mature;
      if (value >= 2) return NsfwLevel.soft;
      if (value >= 1) return NsfwLevel.soft; // PG = 1 maps to soft

      return NsfwLevel.none;
    }
    return NsfwLevel.none;
  }

  /// Converts this enum value to a string for API requests.
  String toJson() => toString().split('.').last;

  /// Converts this enum value to an integer for API requests.
  int toInt() {
    switch (this) {
      case NsfwLevel.none:
        return 0;
      case NsfwLevel.soft:
        return 1;
      case NsfwLevel.mature:
        return 4;
      case NsfwLevel.x:
        return 8;
      case NsfwLevel.xxx:
        return 16;
      case NsfwLevel.blocked:
        return 32;
    }
  }
}

/// Media type for content.
enum MediaType {
  /// Image.
  image,

  /// Video.
  video,

  /// Animation.
  animation,

  /// Audio.
  audio;

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
  String toJson() {
    switch (this) {
      case ModelStatus.published:
        return 'Published';
      case ModelStatus.unpublished:
        return 'Unpublished';
      case ModelStatus.deleted:
        return 'Deleted';
      case ModelStatus.tosViolation:
        return 'TosViolation';
    }
  }
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
  String toJson() {
    switch (this) {
      case PermissionType.view:
        return 'View';
      case PermissionType.download:
        return 'Download';
      case PermissionType.generate:
        return 'Generate';
      case PermissionType.train:
        return 'Train';
    }
  }
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
  String toJson() {
    switch (this) {
      case EntityType.model:
        return 'Model';
      case EntityType.modelVersion:
        return 'ModelVersion';
      case EntityType.image:
        return 'Image';
      case EntityType.post:
        return 'Post';
      case EntityType.article:
        return 'Article';
      case EntityType.collection:
        return 'Collection';
    }
  }
}

/// Hash type for model file hashes.
enum ModelHashType {
  /// SHA-256 hash.
  sha256,

  /// AutoV2 hash (perceptual).
  autoV2,

  /// Blake3 hash.
  blake3,

  /// CRC32 hash
  crc32;

  /// Converts a string to a ModelHashType enum value.
  static ModelHashType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'sha256':
        return ModelHashType.sha256;
      case 'autov2':
        return ModelHashType.autoV2;
      case 'blake3':
        return ModelHashType.blake3;
      case 'crc32':
        return ModelHashType.crc32;
      default:
        return ModelHashType.sha256;
    }
  }

  /// Converts this enum value to a string for API requests.
  String toJson() {
    switch (this) {
      case ModelHashType.sha256:
        return 'SHA256';
      case ModelHashType.autoV2:
        return 'AutoV2';
      case ModelHashType.blake3:
        return 'Blake3';
      case ModelHashType.crc32:
        return 'CRC32';
    }
  }
}
