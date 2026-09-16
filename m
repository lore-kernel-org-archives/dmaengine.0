Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAD53FD27
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572813; cv=none; b=S/xKdl7gVztSeSpOYmPRne8slRv9ugJwFo4qgS+qdNReNJwmgvIjsu5322EaYNxcfo012hNvICvF60rtxE2VN6lvvKWpdYp/s+v02maInYgxNXtQCmHbKwNjW1zj8UiIjuQI7srbr5xTIpMgf5F5taFpRO7VZszTQdFE64XidCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572813; c=relaxed/simple;
	bh=2zXDB5+HAaVgtGGoLZVZUW55AILp6YrQk531wxV817s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TA4YuHvh7A6AIodvlLjVYmB+Na8YffagKR76FksaXj9LXC7NZUxCjsHkcEctfx2KdlhoWkO3xAaiLjSz++ujrfSa0xk4xf/JZJbTvQANUGr6RhgD04T2Shb0xI7Ajl6MQQ8juqg0MXirtpHXm/l3megA0nr5ROwQhctpkkfCxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaAyYgKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaAyYgKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BA71F0089C;
	Wed, 16 Sep 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572805;
	bh=1W7EXsJIAZ0xxl1/AmH2+mC90A3k26wRZGw1ewY89Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IaAyYgKzmLgJl5or/j9+Pp5Eqlf+P4hxGnT7tJKHbZrGrOdrZwjra0yqSU52GfwJs
	 V08hEbFb+trVUXdjfppyH4GrKa8MArO886ezg5GSQS2NGFbSYi9Lh9/j0ijTAtgWnr
	 qj6G4jILOLaKVvG9KAQ84epcTUqgKaPrsORFgNQ0DVKbSx9rNtIVYi6mOFfcTlAWpY
	 KOt26udwKAXQY/BCVPQahMLCrP8QOoihook+ItBKvb2IhnyAy1by2wfYf8VWJ07axW
	 KTyrS+1O5qZiIw2kiYrxSFBS3WID3ARn6LzUKgZrPULivj+vvTwmgPxTqshLcpH1u0
	 e9sEZ5ynhGCLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dmaengine: qcom: use named initializers for
 acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
 <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 15:33:24 +0000
Message-Id: <20260916153325.30BA71F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: qcom: incomplete named initializer transition in hidma_m=
gmt.c
--

commit 9a66310e86b837e8fbd5ab6a856a4abdb2bbb6cd
Author: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

    dmaengine: qcom: use named initializers for acpi_device_id

    Use a named initializer for the acpi_device_id fields which makes the c=
ode
    more readable and consistent with how lists are initialized in the rest=
 of
    the kernel code base. Unify the list terminator to have a single space
    between the brackets and no trailing comma.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d2..1349066b1544d 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pd=
ev)
> =20
>  #if IS_ENABLED(CONFIG_ACPI)
>  static const struct acpi_device_id hidma_acpi_ids[] =3D {
> -	{"QCOM8061"},
> -	{"QCOM8062", HIDMA_MSI_CAP},
> -	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
> -	{},
> +	{ .id =3D "QCOM8061" },
> +	{ .id =3D "QCOM8062", .driver_data =3D HIDMA_MSI_CAP },
> +	{ .id =3D "QCOM8063", .driver_data =3D (HIDMA_MSI_CAP | HIDMA_IDENTITY_=
CAP) },
> +	{ }
>  };

[Severity: Low]
This isn't a bug, but did this commit miss updating a similar struct in the
same module directory?

drivers/dma/qcom/hidma_mgmt.c:hidma_mgmt_acpi_ids:
static const struct acpi_device_id hidma_mgmt_acpi_ids[] =3D {
	{"QCOM8060"},
	{},
};

This struct follows the exact same pattern, but was missed by the cleanup,
leading to inconsistent coding styles within the same directory.

>  MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-acpi-dma-v=
3-0-0dac05654967@thegoodpenguin.co.uk?part=3D3
