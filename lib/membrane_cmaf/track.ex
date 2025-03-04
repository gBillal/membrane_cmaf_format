defmodule Membrane.CMAF.Track do
  @moduledoc """
  Membrane description for a single track in Common Media Application Format.
  """

  @enforce_keys [
    :content_type,
    :header
  ]
  defstruct @enforce_keys ++
              [
                resolution: nil,
                codecs: %{}
              ]

  @type content_type_t() :: :audio | :video

  @typedoc """
  Struct describing a single track in Common Media Application Format.

  The header field should contain binary contents of a CMAF init file.
  """
  @type t :: %__MODULE__{
          content_type: content_type_t() | [content_type_t()],
          header: binary,
          resolution: {non_neg_integer(), non_neg_integer()} | nil,
          codecs: %{
            optional(:avc1) => %{aot_id: binary(), channels: integer(), frequency: integer()},
            optional(:mp4a) => %{profile: binary(), compatibiliy: binary(), level: binary()}
          }
        }
end
