defmodule IsChinese do
  # from https://github.com/alsotang/is-chinese
  @chinese_range [
    {0x4e00, 0x9fff}, # CJK Unified Ideographs
    {0x3400, 0x4dbf}, # CJK Unified Ideographs Extension A
    {0x20000, 0x2a6df}, # CJK Unified Ideographs Extension B
    {0x2a700, 0x2b73f}, # CJK Unified Ideographs Extension C
    {0x2b740, 0x2b81f}, # CJK Unified Ideographs Extension D
    {0x2b820, 0x2ceaf}, # CJK Unified Ideographs Extension E
    {0xf900, 0xfaff}, # CJK Compatibility Ideographs

    {0x3300, 0x33ff}, # https:#en.wikipedia.org/wiki/CJK_Compatibility
    {0xfe30, 0xfe4f}, # https:#en.wikipedia.org/wiki/CJK_Compatibility_Forms
    {0xf900, 0xfaff}, # https:#en.wikipedia.org/wiki/CJK_Compatibility_Ideographs
    {0x2f800, 0x2fa1f}, # https:#en.wikipedia.org/wiki/CJK_Compatibility_Ideographs_Supplement
  ]

  def verify?(str) do
    String.codepoints(str) |> Enum.all?(fn(p) -> in_range?(p) end)
  end

  defp in_range?(codepoint) do
    << int_val :: utf8 >> = codepoint
    Enum.any? @chinese_range, fn(r) ->
      int_val >= elem(r,0) && int_val <= elem(r, 1)
    end
  end
end
