Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B5509F10
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755028; cv=none; b=AF4yXdJwroEs1dNz2A+jU7od5BBg3zrm2ZAN5IvNFggP/wwY6AcXcQbzFVqwMPF7S5YtJOPAe70S7x6k7LcNlfCSqJoQsRUz8mwTEFMrSh6rwfTRYQ4kh9IcbtmmxmaZIMmnh2tMw2Nr6SuezEYr8ITlwukeL0w1JIBieOx3WdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755028; c=relaxed/simple;
	bh=xXqbkNsyR69Mna32/a1BTKXWygANlLfV2Ksh6iStf7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=elMt8VquChN1up345OaXMyHkVpvJ5m2JHZDRLkTUoMGQnd5wioZ/KzwMXJGX9q+iDr+Ua13TRbBNNVlKV6TEUBHmhOyC82UCF3sGFR7cYrmToYTk6SO5XWsxRWH9ac9hWv8NEYWBZazfBOpreBZvRC0P4kzstZis5zoHAni/QHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz+ZtH/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz+ZtH/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFD81F000FF;
	Fri, 18 Sep 2026 18:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789755026;
	bh=bd7ookS5uvbDgYwvHVezWrMxh7NC4YIURqYQjHQ0w48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iz+ZtH/bCE2VScBdOhkbPcDDa6eRqeNaBvaF9DSEoJOiDx5lJEoOBe8aO55hqkRDZ
	 XlUL4wJwGL790DA0iadmzEeumPImqcBJiW4/32in8+SsOnkM3KrfD3HJ36BFyNnlJd
	 NCL8k5RU6KSf/+b5KcRGy12pDoWwvILF6xusoJDhG/BFLzFGfGyUdrUCxQogF1vGMo
	 9Ugw7y9TAoV2aDwv8RURrcBOxX2hH/qfuj7gsv/8kRdt8uJlZ+CaTSgZvIAFBdkOc/
	 lmlbVnilZjH7fzyQSFlM1Eq7wkW65GyOig9Oe6zNs3B5NBEgYfjXv994/XTHdzIWIt
	 9L3xaJZPi/h1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260918175950.21657-1-rosenp@gmail.com>
References: <20260918175950.21657-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 18:10:25 +0000
Message-Id: <20260918181025.DCFD81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kconfig: missing PPC_MPC52xx dependency for SND_SOC_MPC5200_AC97
--

commit 95cb68468081de8e2880323cb63c64d9da8626b0
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: Enable compile testing

This commit relaxing the dependency for the BestComm DMA engine allows it to
be selected on PowerPC for compile-test builds. It adds an alternative
dependency on (PPC && COMPILE_TEST).

> diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfig
> index 5dd437295964d..e23ba4982d7ed 100644
> --- a/drivers/dma/bestcomm/Kconfig
> +++ b/drivers/dma/bestcomm/Kconfig
> @@ -5,7 +5,7 @@
> =20
>  config PPC_BESTCOMM
>  	tristate "Bestcomm DMA engine support"
> -	depends on PPC_MPC52xx
> +	depends on PPC_MPC52xx || (PPC && COMPILE_TEST)

[Severity: Low]
Does relaxing this dependency cause an unresolved symbol during link time f=
or
SND_SOC_MPC5200_AC97?

When COMPILE_TEST is enabled on PowerPC, PPC_BESTCOMM can be selected witho=
ut
PPC_MPC52xx. However, SND_SOC_MPC5200_AC97 in sound/soc/fsl/Kconfig depends
on PPC_BESTCOMM but lacks an explicit dependency on PPC_MPC52xx:

sound/soc/fsl/Kconfig:
    config SND_SOC_MPC5200_AC97
        tristate "Freescale MPC5200 PSC in AC97 mode driver"
        depends on PPC_BESTCOMM

This inherits PPC_BESTCOMM's relaxation and allows the driver to be built
when the platform code is absent. In psc_ac97_cold_reset(), the driver
unconditionally calls a platform function:

sound/soc/fsl/mpc5200_psc_ac97.c:psc_ac97_cold_reset() {
    ...
        mpc5200_psc_ac97_gpio_reset(psc_dma->id);
    ...
}

Since mpc5200_psc_ac97_gpio_reset() is only compiled when PPC_MPC52xx is
enabled, does this result in an undefined reference at link time?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175950.2165=
7-1-rosenp@gmail.com?part=3D1
