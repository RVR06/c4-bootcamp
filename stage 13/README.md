# STAGE 13

![](https://img.shields.io/badge/c4-!identifiers-c49060) 
![](https://img.shields.io/badge/c4-!impliedRelationships-c49060)  

In this module, you will:
- Undersand how `identifiers` work
- Undersand how `relationships` work

⌛ Estimated time to complete: 10 min

## Undersand how identifiers work

Provide identity to `software model` elements is necessary to reference them eg within `relationship` or `views`. It is used to stick to `!identifiers hierarchical`, but for very simple use case. Of course, you need to provide full lineage when you reference an element, which seems counter productive:

```diff
workspace "MILA" "Multiple [...]" {
+	!identifiers hierarchical
	!impliedRelationships false

-   preparation -> uploading "packages" "" ""
+   mila.mobile.preparation -> mila.mobile.uploading "packages" "" ""
```

But it makes sense as soon as your `software model` grows up. You are likely to face such a situation where stuff will become unmanageable. Below `workspace` is invalid:

```diff
workspace {
    model {
        softwareSystem1 = softwareSystem "" "" {
+            api = container "" "" "" ""
        }

        softwareSystem2 = softwareSystem "" "" {
+            api = container "" "" "" ""
        }
    }
}
```

One could argue you could workaround this way:

```diff
workspace {
    model {
        softwareSystem1 = softwareSystem "" "" {
-            api = container "" "" "" ""
+            api1 = container "" "" "" ""
        }

        softwareSystem2 = softwareSystem "" "" {
-            api = container "" "" "" ""
+            api2 = container "" "" "" ""
        }
    }
}
```

but it can hardly be considered as sustainable solution.
Do yourself a favor, stick to `!identifiers hierarchical`.

## Understand how relationships work

`!impliedRelationships` keyword is a way to dry the `relationships` section by leveraging `Structurizr` [inference engine](https://github.com/structurizr/java/blob/master/docs/implied-relationships.md#createimpliedrelationshipsunlessanyrelationshipexistsstrategy).

Applied to our workspace, it means that enabling `!impliedRelationships` will prevent us to declare both `icarus -> mila.store` & `icarus -> mila` relationships, as the latest is infered from the first.

```diff
workspace "MILA" "Multiple Images Lightweight Acquisition" {
	!identifiers hierarchical
-   !impliedRelationships false
+   !impliedRelationships true

	model {
		icarus -> mila.store "fetches materials from" "" ""
-		icarus -> mila "fetches materials from" "" ""
    }
```

Pay attention that the inner `description` is reused, and can introduce consistency issue, as inner `description` insights may leak to upper views, and noise the decision making. Use it with caution. 

## Wrapup

📘 Completing this stage should lead to this [final workspace](./workspace.dsl).  

We took time to craft a `software model`. Let's see how we can [share it](../stage%2014/README.md).

## Further reading

- [!identifiers](https://github.com/structurizr/dsl/blob/master/docs/language-reference.md#identifiers)
- [!impliedrelationships](https://github.com/structurizr/dsl/blob/master/docs/language-reference.md#impliedrelationships)

