Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E833F2D2488
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189311; cv=none; b=KD2tptY0/XoRS9JwqxPwXS2UhZXZXlA76E5ul3rwNlZOkz38s3wn1nKate45Qdg9MEeyadHRj7BuzzqOShmluW5kfUrzXSrEXAVqL425e0S/ln2KwlipkoTClGsAvYkz6vwH6q38EG+CI4nY40u/f0O4iUmMcED7dR7el36Gz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189311; c=relaxed/simple;
	bh=2nCn789w6BHTF9Y8OWVBTWP2/KNRborGl5RlD/Sb+iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=srQnrH8nmVU/JKH7tK+gzfx7KigFIhITM4knXnt/i/EAkteAWaU5phJ9o1GqiEP7gIrH/z3vruOYQxo5LDa05mfcAiZCSFiqxvxBkqY6rJ/18x7LNeImHNwleFUOwZdMrd8clX8xyTW4GFWO1YS0b+LM1GCOguaAaUPihnGYZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdjsSujD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdjsSujD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D01F000E9;
	Sat,  8 Aug 2026 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189309;
	bh=ajswENZdstI7krulPnZebTkNV+t6NkV3UQm3VPh8VtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdjsSujD56TPQoLb4zMzLsQlOjLKGuHovxT0gRaEyaRykadNM1NkWHM1vQIoe7MBo
	 pTm6VQaSUYbFktwMgL9MCph/o/qyYkZsJ84VoYrJC3ml6H30m14PHzFtG37flAY3Co
	 EfHgc6VfKDrPy7wagIuN9VxKEUqwCH7hj5O3P/X6vtPbrB9Abo02rQ+h4zH4O2t/fW
	 ZRRnm/dNJMd2D9yaGwedMHrXVaQboH/ah9kU85qoykQRed+6xJli5ZAm3G/3wPeBG0
	 qM9ln0Pnl66fTc9X8l8ZrA6INe3+s6jjInZwtR2ezseLwAd7oh33y5S2HxrBs4Wg55
	 ntHcFJsZv+ItA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260808112551.2786782-1-lgs201920130244@gmail.com>
References: <20260808112551.2786782-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:41:48 +0000
Message-Id: <20260808114149.397D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The probe error path does not explicitly free the non-MSI interrup=
t before tearing down hardware data structures, leading to a potential Use-=
After-Free.
--

--- Patch [1]: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup duri=
ng teardown ---
commit 70b55f9899639dda5787b14a1ceb8890d7e7d005
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: qcom: hidma: fix autosuspend cleanup during teardown

This patch fixes unbalanced usage counts during runtime PM teardown in the
Qualcomm HIDMA driver. It adds missing pm_runtime_dont_use_autosuspend() ca=
lls
to both the probe failure path and the device removal path.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 7a7f302a96991..d60d5f9a6182f 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -894,6 +894,7 @@ static int hidma_probe(struct platform_device *pdev)
>  		hidma_free(dmadev);
>  bailout:
>  	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but does the probe error path have a
use-after-free risk for the non-MSI interrupt?

Looking at the uninit path just above this in hidma_probe():

drivers/dma/qcom/hidma.c:hidma_probe() {
...
uninit:
	if (msi)
		hidma_free_msis(dmadev);

	hidma_ll_uninit(dmadev->lldev);
...
}

If this is not an MSI interrupt, it remains active when hidma_ll_uninit()
is called because it was registered with devm_request_irq().

The hidma_ll_uninit() function calls tasklet_kill(&lldev->task) while
the hardware interrupt is still enabled.

If an interrupt fires during this window, the ISR hidma_ll_inthandler()
can call hidma_post_completed(), which reschedules the tasklet via
tasklet_schedule(&lldev->task).=20

Since devres will eventually free the IRQ and the lldev memory, could
the re-scheduled tasklet remain queued and execute later, dereferencing
the freed lldev pointer?=20

Should the non-MSI interrupt be explicitly freed using devm_free_irq()
before calling hidma_ll_uninit()?

>  	pm_runtime_disable(&pdev->dev);
>  	return rc;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808112551.2786=
782-1-lgs201920130244@gmail.com?part=3D1
