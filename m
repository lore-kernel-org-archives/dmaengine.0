Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5A23BD06
	for <dmaengine@vger.kernel.org>; Thu,  6 Aug 2026 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020144; cv=none; b=TBRt2H8dXkCXV3KSoNZGavLlkl/aeyYU7HG0DAgtVoi0wZzEqahD16+FHWaNrGJv2EPLT6rVP4b0c0QeV93nJ71dBazVkWbZoGctW+NxKrjViy7fR5eCxH9IMj5DAHwz1PGg9PykluUz1WAW8G44NaU978eIfKsylLbHbmLr2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020144; c=relaxed/simple;
	bh=sSsV3RPWiDX4nzu1t4it2E0HL1b7AAa0uZ99IsaWs00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WrjUdRSoQOLJLxSxuhv7v1PCdm8yIzwsUvj5SznJGsJ/2MJ9MOwpQ299fSUglYwHFbTt/S3HftevpUROy+itcJp81K7zxyM0vbAa7pub2yGRkeV56uqXeV5MQonHak2tm2uHimzU1Tfw7FmfGAe5QKK6SWzK2dCLsjIZCIUMIjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZzirwTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZzirwTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A8A1F000E9;
	Thu,  6 Aug 2026 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020143;
	bh=e1ePuE+6ezvp+DJmrPYRPAkoAU41m6IUbux655Y9cAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZzirwTt7VEq3j26q5b/KblnU6ETwX8peLQZGKn8pTIMZiIGnNoCqdTJClgOw1UBg
	 rwuUPl9ev40tElQaFZDGbhwUjKb8688NFDo9d8MZ31lz/Dc2/LvrVrm6/C7FhGoe6K
	 sH4XDTaZWpNYeaOWuy+7aaVLtS3Lm2Jf4NKsSUMKJNIXZRkQU9G/L0d3dEtON6K/jO
	 VG4CJ8W2rKw9GcoOKlIn3kd/tACvL+U0VoJees3+gpUdLcdbsqAdqSwwLISQ6K/0SJ
	 hhrhbjKFRIp9YT8L2LUuwhgNxk9EtqS0a/JNf+PWRBq1wjHhmTpfFMRFHg0FX88Euf
	 Hq0IC7MslK2Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260806123014.2120447-4-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-4-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:42:22 +0000
Message-Id: <20260806124223.26A8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double-free and list corruption due to dropping the lock during sa=
fe list traversal in zynqmp_dma_chan_desc_cleanup.
--

--- Patch [3]: [PATCH 3/6] dmaengine: zynqmp_dma: Fix stale kerneldoc comme=
nts ---
commit 3c8d64c77aae165a12708426042a7a72be1ba044
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix stale kerneldoc comments

This commit updates various kerneldoc comments across the zynqmp_dma driver.
It corrects parameter descriptions and return values that no longer matched
the actual code implementation.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f7e4a177bd17e..c5b05fd52e9d8 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> @@ -617,7 +617,6 @@ static void zynqmp_dma_start_transfer(struct zynqmp_d=
ma_chan *chan)
>  	zynqmp_dma_start(chan);
>  }
> =20
> -
>  /**
>   * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
>   * @chan: ZynqMP DMA channel

[Severity: High]
This is a pre-existing issue, but can dropping the lock during safe list
traversal in zynqmp_dma_chan_desc_cleanup() cause a double-free or list
corruption?

If CPU1 is running zynqmp_dma_chan_desc_cleanup(), it drops chan->lock
to invoke the callback:

	list_for_each_entry_safe(desc, next, &chan->done_list, node) {
		...
		if (dmaengine_desc_callback_valid(&cb)) {
			spin_unlock_irqrestore(&chan->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&chan->lock, irqflags);
		}

While the lock is dropped, if a concurrent call to
zynqmp_dma_device_terminate_all() on CPU2 acquires the lock and frees
the descriptors, it would move all items from done_list to free_list.

When CPU1 reacquires the lock, it calls zynqmp_dma_free_descriptor(chan, de=
sc)
on the already freed desc. This would double-increment chan->desc_free_cnt.
Furthermore, the loop would continue using the cached next pointer which
is now part of the free_list, potentially causing it to traverse the wrong
list and process freed descriptors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806123014.2120=
447-1-nagendra.golla@amd.com?part=3D3
