defmodule Schizo do
  @modulecdoc """
    A nice module that lets you uppercase or unvowel every other word in a string.
  """

  @doc """
    Uppercases every other word in a string.  Example:

    iex> Schizo.uppercase("Music sounds better with you")
    "Music SOUNDS better WITH you"
  """
  def uppercase(string) do
    transform_every_other_word(string, &uppercaser/1)
  end

  @doc """
    Removes vowels from every other word in a string. Example:

    iex> Schizo.unvowel("Music sounds better with you")
    "Music snds better wth you"
  """
  def unvowel(string) do
    transform_every_other_word(string, &unvoweler/1)
  end

  defp transform_every_other_word(string, transformer) do
    words = String.split(string)

    words_with_index  = Stream.with_index(words)
    transformed_words = Enum.map(words_with_index, transformer)

    Enum.join(transformed_words, " ")
  end

  defp skipper({word, index}, transformer) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformer.(word)
    end
  end

  defp uppercaser(string) do
    skipper(string, &String.upcase/1)
  end

  defp unvoweler(string) do
    skipper(string, fn (word) -> Regex.replace(~r([aeiou]), word, "") end)
  end
end
