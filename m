Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C148F12FF69
	for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896443; cv=none; b=kZFkzFjiPxFe+rfhkJzEPrVQs/Gu0d4yALm2W5qqU6Zg7AmHB8I5o2ic23taiaPqfP3YB6w+aytCGYOfLwpR5ErI6IAeoD+9yGDyoVlInbE2i/n1X4STFqM8mSdSBEnENQU+i+OnvQnlezWOyhfr51Nxg2yjd6tQK4O2bP5HTIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896443; c=relaxed/simple;
	bh=fKpDvLXgMc6kpAO1hojo7DJqaxZYx7J8ufIR/jAXroA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aOWhH4VCKFQkmcRbDlKt77nqXVp5xQ7qO+mx8LkybegCdaS+fcKCeY+lH8rVN3ePqts3cwcB1fxXVYmbvro/l/xEWKJMDuZGCAxNfrvmYXDNL9J6mlWbTDvWop/Az1SdLjey9/UKZne2R49mBF83A1ID2vsYLmDNnltkRCs6KUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kH3RQcbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kH3RQcbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C811F000E9;
	Sun, 16 Aug 2026 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786896442;
	bh=85qWyLnrJwCWJfQKRYNZ5Dlmge22NFNF5PW8CVntyPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kH3RQcbXkzkvyaJ8ssZadzsFjIitk9iDASDdk95V7z8/aBtIPROLK4ivfrnh4WGyY
	 ywWMQZMmQhT/yLZUp1Tb2ZENfEcHbt9B331+FWESvtdRDK+ttPD8s2dATXcy3ZnnMq
	 Ck16WmEt6zLDdw8VrpsTVPupt1Flo/qGQN3/AMBhlSV+IToKc5sq5xG2cVqoFR4M0j
	 BfrBLI/FroGnfq4h6zwtZvop7/ZrYmzyvsUZN7PAFYIMRMG+1ijRq8f6rnlZsLnH/S
	 DXFKaJl6gKLArHfFRYiE4AZym+5xo3PnCzDMobZm1AIwc7tQUzecglgr3eCumYed+i
	 Q2ySwjpeg0tXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put()
 and dma_release_channel()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260816-dmaengine-kref-fix-v3-2-7e76187145df@amd.com>
References: <20260816-dmaengine-kref-fix-v3-0-7e76187145df@amd.com>
 <20260816-dmaengine-kref-fix-v3-2-7e76187145df@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 16:07:21 +0000
Message-Id: <20260816160722.26C811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clearing `chan->slave` before stopping the hardware introduces a N=
ULL pointer dereference in `stm32_dma3_pm_suspend()`.
--

--- Patch [2]: [PATCH v3 2/3] dmaengine: fix use-after-free in dma_chan_put=
() and dma_release_channel() ---
commit c0bca60dc6977cca7352bacd1095081d89c88211
Author: Shivank Garg <shivankg@amd.com>

dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()

When dma_device_put() drops the last reference on chan->device->ref,
dma_device_release() may free the dma_device. This commit caches the
module owner and delays dma_chan_put() to prevent reading freed memory.

Link: https://sashiko.dev/#/patchset/20260518-dmaengine-kref-fix-v1-1-4d612=
5048fb7@amd.com

> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -916,8 +919,6 @@ void dma_release_channel(struct dma_chan *chan)
>  	if (--chan->device->privatecnt =3D=3D 0)
>  		dma_cap_clear(DMA_PRIVATE, chan->device->cap_mask);
> =20
> -	dma_chan_put(chan);
> -
>  	if (chan->slave) {
>  		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
>  		sysfs_remove_link(&chan->slave->kobj, chan->name);
>  		kfree(chan->name);
>  		chan->name =3D NULL;
>  		chan->slave =3D NULL;
>  	}
> =20
>  #ifdef CONFIG_DEBUG_FS
>  	kfree(chan->dbg_client_name);
>  	chan->dbg_client_name =3D NULL;
>  #endif
> +	dma_chan_put(chan);

[Severity: High]
Could moving dma_chan_put() here introduce a NULL pointer dereference
during system suspend?

By moving dma_chan_put() after the block that clears chan->slave, the
hardware channel may still be active while chan->slave is NULL. If a
system suspend occurs concurrently, drivers like stm32-dma3 might check
the hardware state and attempt to print the slave device name:

drivers/dma/stm32/stm32-dma3.c:stm32_dma3_pm_suspend() {
    ...
	ccr =3D readl_relaxed(ddata->base + STM32_DMA3_CCR(chan->id));
	if (ccr & CCR_EN) {
		dev_warn(dev, "Suspend is prevented: %s still in use by %s\n",
			 dma_chan_name(c), dev_name(c->slave));
    ...
}

Since dma_chan_put() (which stops the hardware) hasn't been called yet,
CCR_EN would still be active, and dev_name(c->slave) would dereference
the NULL pointer we just set.=20

Is there a way to stop the channel before clearing the slave pointer
without triggering the original use-after-free?

>  	mutex_unlock(&dma_list_mutex);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-dmaengine-=
kref-fix-v3-0-7e76187145df@amd.com?part=3D2
