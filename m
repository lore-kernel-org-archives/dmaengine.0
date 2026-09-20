Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4D547066;
	Sun, 20 Sep 2026 23:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945528; cv=none; b=O09Sfd8Rv47D3vmhQGVVno0mmEuFGncM8IBwo+T6y0L1PCg9LR7gymGj0NeloiSEGaSqiT/EaWJ6LeptGa4BFgz7H2aT+uct9qI/K+3zMu9ArB1yWOxt2b74aSQtiQURTD4hyNDZry+jx8+dod/Fy6JqW8IwJOtJJJVqO93nVcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945528; c=relaxed/simple;
	bh=RC3ap9g0bSfKfSNvfujg6vgS8YBZMMAYVjutrnaOFQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lSVgwRBSeakPIpTDbmkQwAEnYSW/93rwr3765EYwEZS7SQWwgY3zvvqHK8Gl/DtPdhXOkXYHDAs85fwOVC3qAwLvRnuyZh2vTQcWdaIvmv5xkyGaGxhSf9ETTiF2kjunhVapdofVTCok+Je01pcODWAkdTHVysDM4uvFRwIpBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK3DGT/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK3DGT/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E331F000FF;
	Sun, 20 Sep 2026 23:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789945527;
	bh=hCUaowriA3hZMRn59DPhhzIYIgSKcMxauQD9+dQvkEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SK3DGT/aVfNNXUV+/ir/glJcAxY0ja+/uo7yIo92EX+2AKUx0qFotvrspq4otovjF
	 qvGLP+XZE6bA+8TPhuYHHsxKsqiGIlx406IArr41WoMZA+JnLbLlcpi2RWsk7UPyF6
	 IA1BoN0bhaT9HC5Ad+Quza2oSaF9n2jWdQSy0GMIu0efZavAHjCbL9dmAqwX4UmMCH
	 h+wdnDAGT+3JJImQPW6NOsi6A0bTFbPLXzRQR6UBO/7rSQl0rERZZuYHNe1TvwtU/k
	 nQEAIleTC+xbkeZSdVJlphXwiXgZpSWAdjHN7hNK+5tGfMOPhfrB3B103FL0Ptba3A
	 Mvcy+y9Scu1Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/18] ARM: dts: ux500: Remove DB8500 EPOD regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-18-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-18-9352be6b86b1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 23:05:26 +0000
Message-Id: <20260920230526.D9E331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] soc: ux500: missing v-ape-supply causes dummy regulator warning =
or probe failure
--

commit 3a86fcf38f93ed2dd8837f7b5a7e6f474011a07f
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Remove DB8500 EPOD regulators

Delete the deprecated db8500-prcmu-regulators node and all its EPOD
regulators, including VAPE and VSMPS2. Their external consumers now use
the AB8500 or AB8505 buck regulators, so no compatibility regulators
are needed.

> diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/=
ste-dbx5x0.dtsi
> index 0603244dc9e83..efc84e018c44a 100644
> --- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
[ ... ]
> @@ -1122,8 +1031,6 @@ msp0: msp@80123000 {
>  			compatible =3D "stericsson,ux500-msp-i2s";
>  			reg =3D <0x80123000 0x1000>;
>  			interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> -			/* TODO: delete and replace with power-domain handling */
> -			v-ape-supply =3D <&db8500_vape_reg>;
>  			power-domains =3D <&pm_domains DOMAIN_VAPE>;
> =20
>  			dmas =3D <&dma 31 0 0x12>, /* Logical - DevToMem - HighPrio */

[Severity: Medium]
Will removing the v-ape-supply property cause regressions in the
ux500-msp-i2s driver?

Looking at sound/soc/ux500/ux500_msp_dai.c:ux500_msp_drv_probe(), it
unconditionally requests this regulator:

	drvdata->reg_vape =3D devm_regulator_get(&pdev->dev, "v-ape");
	if (IS_ERR(drvdata->reg_vape)) {

Will this missing supply cause the regulator framework to fall back to a
dummy regulator (emitting a warning) or return an error and break the
driver probe entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ux500-powe=
r-domains-v7-1-v3-0-9352be6b86b1@kernel.org?part=3D18
