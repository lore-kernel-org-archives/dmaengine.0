Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC693749E7
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641535; cv=none; b=IBXbYEPudZAXwtsLwWHK8P2l+qiKw0wZYKPeWcAEWN++sl2OPRTXMoLV+z2Vol1Veae6XXJSRZFU/eLt8DvKNIoAxqKPKaF+USzHQOAAlKKxOgeunAW73eWNO229AAzQhYchLtY5oC3KmvklVnZaFOg8+FbefgrC6j+vDGa7/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641535; c=relaxed/simple;
	bh=ouqu+CcfiN0CDqda/jK9PkqdO+tHtKkgyoxU3nCfW/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FIxC1gAbU3Yhvu7NrVCmQTLtSNfjNa1qA003LHTfvZCRpmv/zEDMYkQEENUVKWQuSi9ZdfgyBxNEm0eJhwTHXcatfhIJrexBryJ/45VVE8ABNa6wetHe9DfLIYuJuSfoBC+ALn48bScubc/FmoGYywC7PUxbLFSGnbE4OABe1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G47db2JG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G47db2JG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D262A1F00A3D;
	Tue, 21 Jul 2026 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641534;
	bh=FXnAKKzugRZYhSbALCHL1yXfnEnWH9sEAKvZYz9WDpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G47db2JGyDKEc9KvppvaZtjEg1GqEAaeURvSXdqI0VqaaU0Zi27rUyVgNT1LoRhs/
	 ZEHdD7YX2LZYP1j20UzUPqW4epdvvQi3A1qwsU3PI8CCL4s2h8saFDqLq7uGJm/0Ls
	 dz+9Wv0SoNFLsglq4HQQV+x0G4Z3bPB7i33DHBEARtJxS/1WJqI4KqYl2auDxwvgPZ
	 mSolQyDKlflF5PEzIAdVqz2pxxMQk7h1w2q/Q8BB3A9cESQtZlCEaa3P5XlobfzZNE
	 YTuau4AY+iPltUDTmU2CI19UDTTeOw5IpiaaHxUoC7jwx6r6ezaJQRyDGfgkHpO07W
	 BKr3EDmQT5Zdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-5-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-5-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:45:33 +0000
Message-Id: <20260721134533.D262A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unclocked BAM register access in bam_dma_remove() causes system cr=
ash.
--

--- Patch [5]: [PATCH v23 05/14] dmaengine: qcom: bam_dma: Add pipe_lock_su=
pported flag support ---
commit 52e9e906437f52a7f85afb39e2221eefc5535d38
Author: Bartosz Golaszewski <brgl@kernel.org>

dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support

This commit extends the device match data with a flag indicating whether
the IP supports the BAM lock/unlock feature. It sets this flag to true
on BAM IP versions 1.4.0 and above.

> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 8ce0fe085c5fe..f3e713a5259c2 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential system
crash during the device unbind or module unload path in this file:

drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
	...
	pm_runtime_force_suspend(&pdev->dev);

	of_dma_controller_free(pdev->dev.of_node);
	dma_async_device_unregister(&bdev->common);

	/* mask all interrupts for this execution environment */
	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));

	for (i =3D 0; i < bdev->num_channels; i++) {
		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
	...
}

Does this sequence trigger a synchronous external abort on ARM architecture=
s?

The call to pm_runtime_force_suspend() shuts off the BAM device clock, but
the function then proceeds to execute unclocked hardware register writes via
writel_relaxed() and indirectly through bam_dma_terminate_all().

Can this hardware safely handle register accesses after its clock has been
disabled, or will this crash the system during teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D5
