<#-- @ftlvariable name="self" type="com.tallence.formeditor.cae.elements.TextField" -->
<#-- @ftlvariable name="cmpage" type="com.coremedia.blueprint.common.contentbeans.Page" -->

<#assign validator = self.validator />
<#assign isMandatory = self.mandatory />
<#assign hasRegexpValidator = validator.regexp?has_content?then(validator.regexp.pattern()?has_content, false) />

<div class="form__group">
    <div class="input-text clearfix">
        <div class="row">
            <div class="col-10">
                <label for="${self.id}">${self.name!""}${isMandatory?then(' *','')}</label>
            </div>
            <div class="col-2">
            <@cm.include self=self view="fieldtip"/>
            </div>
        </div>
        <div class="row">
            <div class="col" :class="{'is-invalid': errors.has('element_${self.id}') }">

                <#assign veeValExpr = ""/>
                <#if validator.maxSize?has_content>
                    <#assign veeValExpr = veeValExpr + (veeValExpr?has_content?then(", ", "")) + "max: " + validator.maxSize />
                </#if>
                <#if validator.minSize?has_content>
                    <#assign veeValExpr = veeValExpr + (veeValExpr?has_content?then(", ", "")) + "min: " + validator.minSize />
                </#if>
                <#if hasRegexpValidator>
                    <#assign veeValExpr = veeValExpr + (veeValExpr?has_content?then(", ", "")) + "regex: /^" + validator.regexp.pattern() + "$/" />
                </#if>
                <#if isMandatory>
                    <#assign veeValExpr = veeValExpr + (veeValExpr?has_content?then(", ", "")) + "required: true" />
                </#if>

                <input type="text"
                       class="form-control"
                       :class="{'is-invalid': errors.has(element_'${self.id}') }"
                       id="${self.id}"
                       name="element_${self.id}"
                       value="${self.value!""}"
                       <#if veeValExpr?has_content>v-validate="{ ${veeValExpr} }"</#if>>
                <small class="error text-danger">
                    Bitte das Feld ausfüllen.
                </small>
            </div>
        </div>
    </div>
</div>