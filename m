Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667647D947;
	Thu, 13 Aug 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630647; cv=none; b=qPf2IjGNIe9QMh5P+HkHqcYk20ZWYJ/y3bb+K5tcvSF2zKPhMFccu2RWdObUdinbiTrvqUhJI81IBeTf8NcN1mOqc9KIlES73Cbc4jwm8d9dXYgIl2hAKkXSZHHHoQyJGYB+qkX6lwRVHqL9KWJF0ALkWhxuKJvz+I/Jz+ICJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630647; c=relaxed/simple;
	bh=xufGJCHZmAxCLz55bOgddxSyafV75ZhNOU8Mrg3XOwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmtsiaoGWJTPmH9awcMcOXqS8zFxGFbEFXlj/uwy2MkpewUZywolwQ6Y7AxiDk6lmjE+F7zvsKQpO7+0NzrLTe7EQ3bapkpBdfzMWJ7BpFaSQNYlZo9kAsZ2OPpFsKZsuexjZ7gcl1dZOMbmuibPWCXTKTBKzllxnnJerZQqJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVIYuf/o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVIYuf/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735261F000E9;
	Thu, 13 Aug 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630644;
	bh=xAtaJN6M4HbQi3NVc67bMh+szwiUAcTgTNT8c3t4saI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVIYuf/ovh0tBffPEVGT/is4uKcXO3f0eOpJUk6BEo4tJ+ZaY4TOUTJ3aMJGuHetm
	 gzvxeqtWbLKXurkpxN21diMxw6YeDVJZ9fZJ68nJnTVCYTrKrCt4KUx1hFfRGOoILz
	 CrEPENJwiupINZFN+gMF71t1AVx3tFBZr7z7u9biM/A95aeRzG/++KXZZiUSkREkc8
	 jsCsxdRIXac7Li5cLWr6RMi/WlafwLYWODiA+sqSU6TPGc7LhuOE5/6ZWLYRb+rZlh
	 6BloUhMQBTXovga6FBv8j1bPB1zEP2H8U+RKCc+R6YsVZtcFasW+dSOZqANquosUNs
	 KVbY39kqLYF7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813140047.1006478-4-mukesh.savaliya@oss.qualcomm.com>
References: <20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com>
 <20260813140047.1006478-4-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:24 +0000
Message-Id: <20260813141724.735261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `qcom,qup-multi-owner` DeviceTree property is never parsed, ma=
king the `multi_owner` feature completely non-functional.
- [High] The runtime PM suspend callback `geni_se_resources_deactivate()` l=
acks the `se->multi_owner` check, breaking multi-owner controller operation=
 during runtime suspend.
- [High] The GPI DMA driver prematurely releases the hardware lock during m=
ulti-message I2C read transactions, destroying bus atomicity.
--

--- Patch [3]: [PATCH v9 3/4] soc: qcom: geni-se: Keep pinctrl active for m=
ulti-owner controllers ---
commit ceae3d1ac31371a041b92e87207badc3969f7e87
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

soc: qcom: geni-se: Keep pinctrl active for multi-owner controllers

On platforms where a GENI Serial Engine is shared with another system
processor, selecting the "sleep" pinctrl state can disrupt ongoing
transfers initiated by the other processor. This patch skips selecting
the sleep state when the engine is marked as shared.

> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni=
-se.c
> index 873bfbd6b2b7b..a4da75d54d6c3 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -610,9 +610,17 @@ int geni_se_resources_off(struct geni_se *se)
>  	if (has_acpi_companion(se->dev))
>  		return 0;
> =20
> -	ret =3D pinctrl_pm_select_sleep_state(se->dev);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Select the "sleep" pinctrl state only when the serial engine is
> +	 * exclusively owned by this system processor. For shared controller
> +	 * configurations, another system processor may still be using the pins,
> +	 * and switching them to "sleep" can disrupt ongoing transfers.
> +	 */
> +	if (!se->multi_owner) {

[Severity: High]
Where is se->multi_owner populated from the DeviceTree?

I don't see any parsing for the "qcom,qup-multi-owner" property in this
patch, which seems to leave the multi_owner flag permanently false. Does
this code require a device property read somewhere else to function?

[Severity: High]
Are runtime PM transitions handled correctly for shared controllers?

Looking at geni_se_resources_deactivate(), which is used by protocol drivers
like I2C for runtime suspend, it lacks a similar check:

drivers/soc/qcom/qcom-geni-se.c:geni_se_resources_deactivate() {
...
	ret =3D pinctrl_pm_select_sleep_state(se->dev);
	if (ret)
		return ret;
...
}

If a shared controller goes into local runtime suspend, won't it still force
the pins into the sleep state and disrupt ongoing transfers on the other
processor?

> +		ret =3D pinctrl_pm_select_sleep_state(se->dev);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	geni_se_clks_off(se);
>  	return 0;

[ ... ]

> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/ge=
ni-se.h
> index 29a53bbc0dd49..725f89a445511 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -78,6 +79,7 @@ struct geni_se {
>  	struct geni_icc_path icc_paths[3];
>  	struct dev_pm_domain_list *pd_list;
>  	bool has_opp;
> +	bool multi_owner;
>  };

[Severity: High]
Does this multi-owner configuration break transaction atomicity for
multi-message I2C reads?

Looking at the I2C driver, it disables multi-descriptor batching for reads:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_xfer() {
...
				gi2c->is_tx_multi_desc_xfer =3D false;
				break;
...
}

This causes DMA_PREP_INTERRUPT to be set on the write leg of the read
transaction.

The GPI DMA driver appears to interpret this flag as the end of the entire
batch and inserts an unlock command:

drivers/dma/qcom/gpi.c:gpi_create_i2c_tre() {
...
	if (chan->multi_owner && is_last && i2c->op !=3D I2C_READ) {
...
}

Will this prematurely release the hardware lock before the read leg execute=
s,
allowing another processor to inject traffic and corrupt the bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140047.1006=
478-1-mukesh.savaliya@oss.qualcomm.com?part=3D3
