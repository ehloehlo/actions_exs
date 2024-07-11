defmodule ActionsExs.System do
  alias ActionsExs.Counter
  alias ActionsExs.Repo

  def get_counter() do
    case Counter.get_click() |> Repo.one() do
      nil -> init_click()
      cnt -> cnt
    end
  end

  def update_counter(cnt) do
    cnt
    |> Counter.changeset(%{click: cnt.click + 1})
    |> Repo.update!()
  end

  defp init_click() do
    %Counter{click: 0}
    |> Counter.changeset()
    |> Repo.insert!()
  end
end
