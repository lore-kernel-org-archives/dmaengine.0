Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CC55293C
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572911; cv=none; b=UzZye5XQDWrkSUwIwQjxKdiSRDQJ+gS8BmJM19Yj1OyvGkmcqB1DaNpxSMLk4Akbghi9jmRh3w+PlTErandpQPa47LJgLlw35gvONVu2TMmlynAt8ojxAoHGK+bdEzY5iaNTULP23m0kAMYkFmoOxvTt8TzN6T9AdJ0ElnVCEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572911; c=relaxed/simple;
	bh=Ar2NNdQ+Rv0boeWmEpoRPoaJjkDtKccuOsDWhUqI2xc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hyc99nHywzg1JYJ5qKdm+yDf9PgQl8Tv9C+CDQivUlKsTEmDy+FW3HhFjq0xX22+gj14V9lG7arOHrmbzjp9QJqlbMertFy/TlAwwNM74mqhd33Znn/zWcQrolSszh4MkwL5tB7kIlfONzzmm5fiECDJW7xgyTY++SHbtiAMB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUccTUwu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUccTUwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFC51F000FF;
	Wed, 16 Sep 2026 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572901;
	bh=PMIVzSgr8BZ67eUq+wZ4eWAiNpXpa1BEbEBdvHRPxvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUccTUwumhM7Om2+g/cblqvFdW0thzNwCu/iVpCXt5alR8+fr40JdcGJUCya7KkPl
	 fbo+OwumdLKBP3J1IqF7BbjnCYfOf81EZsJtVmO4xGB5jAhtqM4gypbRLe7m+R5DfZ
	 joLymjpuE2nO69NuUNity/19ITL67EMajvZImS+fQwjjb04Z1m4Tz0UFMceqWy+wX3
	 N2g2XHAWJWdIKAwdIGQfs8jT6g55qpLNmQBYqVe/Nbvb2aXftQr6JrSuIhK5rij7cz
	 Gdrj1R2tNY3OyfM8D7XWwAwFFwW3qCGTUhPsvVwZofWe2B/2MSHsXm3AVoUlQVjQrV
	 LAwe1dJ6AWSKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dmaengine: loongson: use named initializers for
 acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
 <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 15:35:01 +0000
Message-Id: <20260916153501.9CFC51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: loongson: incomplete unification of list terminators
--

commit 4321a78607f15fa601095e26975f8fbd9cdea572
Author: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

dmaengine: loongson: use named initializers for acpi_device_id

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/l=
oongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..70880625c6e92 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of=
_match[] =3D {
>  MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
> =20
>  static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] =3D {
> -	{ "LOON0014", .driver_data =3D (kernel_ulong_t)&ls2k3000_cmc_dma_config=
 },
> -	{ /* sentinel */ }
> +	{ .id =3D "LOON0014", .driver_data =3D (kernel_ulong_t)&ls2k3000_cmc_dm=
a_config },
> +	{ }

[Severity: Low]
The commit message mentions unifying the list terminator, but does this miss
the OF match table located immediately above?

drivers/dma/loongson/loongson2-apb-cmc-dma.c:
static const struct of_device_id loongson2_cmc_dma_of_match[] =3D {
	...
	{ .compatible =3D "loongson,ls2k3000-dma", .data =3D &ls2k3000_cmc_dma_con=
fig },
	{ /* sentinel */ }
};

Should the list terminator here also be updated for consistency?

>  };
>  MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-acpi-dma-v=
3-0-0dac05654967@thegoodpenguin.co.uk?part=3D2
