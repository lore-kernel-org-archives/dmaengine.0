Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7DE3DBD76
	for <dmaengine@vger.kernel.org>; Tue,  8 Sep 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903621; cv=none; b=jaA7A3QSs4WE3vlurmh4D03q+BaDGMOuIs3+rjrbn6nMewHEwzV/nWSneRVZKvFX1PZsAJ2U6noK8lETb5dcBR4ucRad+DDdck3mE+KChNPvwyh/lvKtLMCeKai4A7mkeyqvVsWyn72dY6cg4nhHVlcSMM/aIBJlUaGRp9imZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903621; c=relaxed/simple;
	bh=lYNCsml68QVyCK3HVXsZwp9Wuh/p/f+gg2SAkT7S7bA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUHkmIrdl2+tgabn4GJ42wvFqow43NLr0JKvMoK/dYKhiCl2mUF7mPhyCgRCv4BSQK9DqS27eZSKCos8lO9ddnUqtQSol9enMHaUXnDWPsKtFZyq+U+hHaZijcVxZGCXsDLvJqUo9Tf2c9FtN+u2tAJGTuZ1iH3SdZUasI1nhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dus9htxH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dus9htxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368631F00A3D;
	Tue,  8 Sep 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788903620;
	bh=ZJUDxuS8eukW6FbjfA6DxE7hHfJz1avRJsuf5kqquw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dus9htxH8zi6XZTPvtd0G/DjfSC351qf/Z5GwFAa2OuEqQsM1BsiL9gBaqZDN4GCq
	 Q12rCe28YnLcXMq5odk7MWCZ8eKsROM132HX5xbzMYoa0LLLwwvNPxsNX9GvR3+Pm6
	 hncc2a3ghqLYcklCriEJzyvKCYiw2tXQvxPIB3aRX4HEyEJaTitPo38sarG4sZJOz8
	 1kDh0oobW41a2gGuA77f/O6DguEMD8Vpsb53eTXY7wMErLdB6rSXxsBRFJqsli114Y
	 9GSdBZXvjrfodgvv/fg0me4+DZOK00yRs4yBgMZF7la/CFHkQqez4tOKo8BmcVBhfj
	 OFxb+6DtP+iSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: bestcomm: ioremap early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260908213049.592138-1-rosenp@gmail.com>
References: <20260908213049.592138-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 21:40:18 +0000
Message-Id: <20260908214019.368631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global pointer `bcom_eng` is freed on the probe error path but=
 not set to `NULL`, leaving a dangling pointer that can cause a Use-After-F=
ree.
--

commit 0501c17dd28799067260abc5f8abeeda8383de19
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: ioremap early

This commit replaces the open-coded resource lookup, allocation, and mapping
in the mpc52xx_bcom_probe() function with
devm_platform_get_and_ioremap_resource(). It also simplifies the error
handling by removing the manual unmap and release paths.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> index 432b43520ddc9..44ff4a42376b1 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
[ ... ]
> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device=
 *op)
>  	return 0;
> =20
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);

[Severity: High]
This is a pre-existing issue, but does this error path leave a dangling
global pointer?=20

If bcom_engine_init() fails during mpc52xx_bcom_probe(), the global
pointer bcom_eng is freed here but is not reset to NULL. Could
subsequent calls to exported functions like bcom_task_alloc() by
consumer drivers bypass their safety checks (e.g., if (!bcom_eng)) and
attempt to acquire bcom_eng->lock, resulting in a use-after-free and a
kernel crash?

>  	bcom_sram_cleanup();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908213049.5921=
38-1-rosenp@gmail.com?part=3D1
