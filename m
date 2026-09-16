Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41B4A9D61
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551824; cv=none; b=CGsATu4cPqh78TWan4g26dOi+5L4ii4p2q5xvUYwSIWQ/zlkPox+wtBu40qgcEuVrP2EyKE3MP/V1PLO6s2rDZ7rV8DPvJA66ozNG7BIDyAXLOJql0a/4UgZtChoRYytu09986BcyonJEnQECeK5n5WMjcWVR0cp73I3hTFZ/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551824; c=relaxed/simple;
	bh=ZRuXNBYHExOE3/RH8bx2JfjKK/5sPYfX4JWZeRJEFug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iUOhl/yBpc5WmQ7OZjOoZTJIQlwK0F7EpQW16FxJSLqgmL6o3Z6jdr+bhieaj7T/g5OxzscQyBVjcQQxahUgZI1fzyTjF9oZ0Z0Tfh046ZzsdcqQBp2TWjK/9CPQXPZ9HriK42fu+o2nosMu9bIxbfxf4RsjOvRy9ilvJlqYwiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7ObG/wn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7ObG/wn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E304B1F000FF;
	Wed, 16 Sep 2026 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551815;
	bh=8Ua4t0HO4UQC/kzDkPtBs+qbnhLlLuBvgYZ4qn31FrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7ObG/wnocL7dZMRkKafsw5Omr3CN/YdS35bJiXgtoSHi1tjg7pGwZXQ0WJSoCYTP
	 IY5jYFUUMSPSXqFKKFwLfwru+zinTkrY6Ig1tj4yb9FLEJl+xO55nLKenHGupFER9Z
	 n6wJa1cj0MnsMHjIG9UNxoUErQf/mmtXhKsZhbBVi+PZb1lB8RaIfXI0NGIxlatbAx
	 zGDRBXJ6USnbqSm6KRByPJOyb3fRZTXObEfTiCVy5gHFRRbcjsHxMpixiHMqtAxdpX
	 P9OCbPp6Sjtt18Tt01rS/mSApQPTqj6s3+/SXVPkGAfUxjIsdyX/IjTCp411qHYXez
	 I7E3u6UwLFENw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom_hidma: Fix runtime PM leak in
 hidma_issue_task()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260916093032.2003397-1-vulab@iscas.ac.cn>
References: <20260916093032.2003397-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:43:34 +0000
Message-Id: <20260916094334.E304B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: qcom_hidma: stranded active descriptors on pm_runtime=
_get_sync() failure
--

commit 77de19698670459fd2543b487a29198a77d2c2e6
Author: Wentao Liang <vulab@iscas.ac.cn>

dmaengine: qcom_hidma: Fix runtime PM leak in hidma_issue_task()

This commit fixes a runtime PM usage counter leak in hidma_issue_task() by
checking the return value of pm_runtime_get_sync(). If it fails, it drops
the counter with pm_runtime_put_noidle() and returns early to avoid starting
the transfer.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d2..5ed6c77e2b212 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -219,7 +219,10 @@ static void hidma_issue_task(struct tasklet_struct *=
t)
>  {
>  	struct hidma_dev *dmadev =3D from_tasklet(dmadev, t, task);
> =20
> -	pm_runtime_get_sync(dmadev->ddev.dev);
> +	if (pm_runtime_get_sync(dmadev->ddev.dev) < 0) {
> +		pm_runtime_put_noidle(dmadev->ddev.dev);
> +		return;

[Severity: Medium]
Does this early return leave active descriptors stranded without cleaning
them up?

When a DMA client queues a transaction, the descriptors are moved to the
active list before hidma_issue_task() is scheduled. Aborting the state
machine here without initiating the hardware transfer or failing the
descriptors can leave them permanently stuck.

This could cause DMA clients to hang indefinitely while waiting for
completion callbacks that will never arrive.

> +	}
>  	hidma_ll_start(dmadev->lldev);
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916093032.2003=
397-1-vulab@iscas.ac.cn?part=3D1
