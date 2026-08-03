Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F040314F;
	Mon,  3 Aug 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757423; cv=none; b=Quybgq4JchU30eegxnzpTelR3eMBxLNEa4QNQXxaewHfsK4bwUWxenTLfOUR7Tc09xC/A6liES9D3H8OP/XyEmrYnhdnRYvsQrRkbke6aMnrsIQNMsa3bEwS5pN1knFVPHshCaGNJQ+5kqp9BOHt6B6hdTo+SErWIHslzjaOv7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757423; c=relaxed/simple;
	bh=svDLz6Db8KTg4IecGoM1Si9yz3v9pjwTYUJj1cwicis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UU/Ru7NB6zQSPrn62CUIfUW6sbsjH3KNlQr+Nu1EZfj2wMWHbvYM5p3tezb3MuoQZuLfscIxJsSObZ9vW68xylxof9OT/ZqUCOdRCGFveGabL6p8Bgv+GwiTSHdh2yN+tHRQKwX2UMHvR+gko13x9M7Owm8NehWaypSacM47yAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mkl9ADWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mkl9ADWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5631F000E9;
	Mon,  3 Aug 2026 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785757421;
	bh=s2VUhAXxgWe8rMMFLTu1SeaPlqY/KqYRPjfbYIPTioI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mkl9ADWrfcx52HI6iRmtEjR+0Ty9SFwkXcFQRYWSz/gTDuWVvioECS8sZES4R1J29
	 mGGBIqxyWp81i9b9u5RFd9dPPmHQf3QYjfAxbAJmbAai3bJHKe7vUeYkoA3Q+LYIGc
	 eF2mRWuzV/HYQJzJkyhS8OZBDwIHOsg8WR0UOIyfU/Ro5QO1qbajDzzKGKjQ1XmzXc
	 XfuM37n2WJ8Vi5nhdgdydc4Gwadmwjhibazsc6T87E/3wOi9DdVKGY7dAh3kh1mDZi
	 mAwzddigdhBUrZPVbblb/gw+OCHIjjBzGunDlDJ0/ugDGfPbD81UmEcySoPQPyWxsI
	 45KImgXwScYOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260803-shikra-dt-m1-v7-10-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
 <20260803-shikra-dt-m1-v7-10-7fec8e777076@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:43:40 +0000
Message-Id: <20260803114341.5E5631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] An unintended extra leading space is present before the `gpio-reser=
ved-ranges` property definition in `shikra-iqs-som.dtsi`, breaking standard=
 DT indentation.

Pre-existing issues:
- [High] Missing `gpiochip_line_is_valid()` check in `msm_config_group_set(=
)` allows secure world fault via pinconf settings.
--

--- Patch [10]: [PATCH RESEND v7 10/10] arm64: dts: qcom: shikra: Add gpio-=
reserved-ranges to tlmm ---
commit ed56ddbc066b2d1385abdc3ef44f21fea529dddb
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

This commit adds the gpio-reserved-ranges property to the TLMM node for both
Shikra SoM variants (CQM and IQS). These reserved GPIOs are inaccessible fr=
om
the non-secure world and dedicated to fixed functions.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-cqm-som.dtsi
> index 2fff5fe9f6d2f..8ac42ff625a0e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> @@ -196,6 +196,12 @@ pm4125_l22: l22 {
>  };
> =20
>  &tlmm {
> +	gpio-reserved-ranges =3D <6 4>, /* Fingerprint SPI */
> +			       <14 4>, /* eSE SPI */
> +			       <30 2>, /* NFC SPI */
> +			       <138 1>, /* NFC Secure IO */
> +			       <155 11>; /* eMMC Boot */
> +

[Severity: High]
This is a pre-existing issue, and was not introduced by the patch under
review, but does defining these reserved ranges expose a missing validation
check in the pinctrl driver?

If a device tree node requests a pinconf setting (such as bias or drive
strength) on a pin reserved via gpio-reserved-ranges, the generic pinctrl
core (pinconf_apply_setting) bypasses pin_request and directly invokes the
driver's callback:

drivers/pinctrl/qcom/pinctrl-msm.c:msm_config_group_set()

Since msm_config_group_set() lacks a gpiochip_line_is_valid() check, it
directly reads and writes the protected TLMM registers for the secure pin,
triggering a secure world hardware fault.

Could this be triggered by a buggy OEM devicetree or a devicetree overlay
loaded from userspace?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/bo=
ot/dts/qcom/shikra-iqs-som.dtsi
> index 657a14ca96067..4ff97945274dd 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
> @@ -218,6 +218,12 @@ pm8150_l18: l18 {
>  };
> =20
>  &tlmm {
> +	 gpio-reserved-ranges =3D <6 4>, /* Fingerprint SPI */

[Severity: Low]
This isn't a bug, but there is an unintended extra leading space before the
gpio-reserved-ranges property.

> +			       <14 4>, /* eSE SPI */
> +			       <30 2>, /* NFC SPI */
> +			       <138 1>, /* NFC Secure IO */
> +			       <155 11>; /* eMMC Boot */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-shikra-dt-=
m1-v7-0-7fec8e777076@oss.qualcomm.com?part=3D10
