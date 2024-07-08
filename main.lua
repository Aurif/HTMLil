require("htmlil")

document(
    tags.body(
        tags.divColumn(
            tags.span("owo x3", style.marginTop(5)),
            tags.span("owo x2"),
            tags.span("owo x1", style.marginLeft(14)),
            tags.divRow(tags.span("uwu x3 ", style.marginLeft(14)), tags.span("uwu x2 "), tags.span("uwu x1 ")),
            tags.divColumn(
                tags.span(":3 x3", style.marginBottom(3)),
                tags.span(":3 x2"),
                tags.span(":3 x1")
            )
        )
    )
)
