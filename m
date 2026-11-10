Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306681;
	b=RVxfszEyriwJVw5BaVGvsxW5oD2ldj2Wk0VwOHFiHFGeIfEjbu7oemnpmHgwA9fVSjfY
	 ODjVcx7ykJpBsMfknV3IZWhB6tqIjnEcrAbVbpXJ6gBz9Ejq/MPqWCeV5J+/EMfM4dgh2
	 vkcM55uYq29x4IZJtXS8SbBORYLxQeaDiI/42zNpo++NJvoj1+9EF72bIPgfeRZJfegtg
	 3LdPAqt+ubAY69PrZUJMeW4rssM7sGG2n0q4Pbw5Ic6WQC4mQwUiArmMcmuJaKfCWz2lx
	 7pofCSVNHqwWAROiNgEfb0/4eN3zfSXTXVLERC7Tk6Vvv5Ol1DTFfMlnrl0NMQoRjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QgZMixIxLAg53dY0VhcDGgcDQw04JElk01qwve4w8qo=;
	b=E+gacC/+Q+GTolEkQwHAcRAYH3g96wEMpaHjui2369SxfXW2XRTpIkkUKmcNcPpeQrhu
	 XPNto+HgPT4TeCF4UjTnl8NCbdbZjBUxSjr6C8/obqEJiieVjvcbDo+9USyEJ8MjJLQUi
	 7rkZ6Y3wOa/jKd2RTLTrsCVr5ADEGYuk1aERsLacMxkslxLtcM+O7k0E0c7mILHM8o/my
	 YouaQQZ93SLhbnzrS36lMcu6zQm8RZ4Ylc7O5gtvuj8sVZpKXvdLT1oJjQnFvIecDMs+R
	 mPoQ9VOWOl8ESqioNgzWYbmHv8fTn6yNrtXOC1sknmFYDUzL2KaRniqE1X9/whHCQlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY7fi84s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E5606A325
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY7fi84s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC741F008A1;
	Tue, 10 Nov 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794306680;
	bh=QgZMixIxLAg53dY0VhcDGgcDQw04JElk01qwve4w8qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kY7fi84slo9o1CRIn5Xr1U3HHyulMo00rXTv0XP3zqXGGQFTG9JF841lXPlxsxu8F
	 wRLlZaC5z5deMVvF/En3QsbZVEzMgjq2ieL/GlC7byk1P+UsyHGVb7qRVTDdCFnYeS
	 w0h7ifcDE29aCNnQn5iAr55uUuslltLMIh1GWRmLO8MbQhfHAPV7KUcqgWP3pA48Z5
	 pA5m4cK14obbqaNdnqNnfl5M8hX7Z+mhrBYAo7l4FGbCyoI5BaqhFyKi8OtYQks1WF
	 lhoBeo7wAZZXAycfyxKDk8MJfpYu4dlpmO/cYsmX9X+wn+NN0OHZ/Y3HhmN0QGGVtY
	 J+NEK/1yky7fQ==
Message-ID: <sashiko-outbox-206873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: Free channel ID after device_unregister()
Reply-To: sashiko-reviews@lists.linux.dev
To: zhejun_huang@linux.alibaba.com
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110101607.13784-1-zhejun_huang@linux.alibaba.com>
References: <20261110101607.13784-1-zhejun_huang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:31:19 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] dmaengine: IDA leak on error path in
  dma_async_device_register() [1]
--

commit e2b5dc17e7cb70401abfdf640998b8028522d873
Author: Zhejun Huang <zhejun_huang@linux.alibaba.com>

dmaengine: Free channel ID after device_unregister()

This commit moves the ida_free() call in
__dma_async_device_channel_unregister() after device_unregister() so that a
concurrent channel registration cannot reuse the channel ID before the old
device name is removed.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21d..2642abf105d76 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1171,8 +1171,8 @@ static void __dma_async_device_channel_unregister(s=
truct dma_device *device,
>  	device->chancnt--;
>  	chan->chan_dev->chan =3D NULL;
>  	mutex_unlock(&dma_list_mutex);
> -	ida_free(&device->chan_ida, chan->chan_id);
>  	device_unregister(dmaengine_chan_dev(chan));
> +	ida_free(&device->chan_ida, chan->chan_id);
>  	free_percpu(chan->local);
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but does the error path in
dma_async_device_register() leak IDs from device->chan_ida and dma_ida
[1]?

drivers/dma/dmaengine.c:dma_async_device_register() {
    ...
err_out:
	/* if we never registered a channel just release the idr */
	if (!device->chancnt) {
		ida_free(&dma_ida, device->dev_id);
		return rc;
	}

	list_for_each_entry(chan, &device->channels, device_node) {
		if (chan->local =3D=3D NULL)
			continue;
		mutex_lock(&dma_list_mutex);
		chan->chan_dev->chan =3D NULL;
		mutex_unlock(&dma_list_mutex);
		device_unregister(dmaengine_chan_dev(chan));
		free_percpu(chan->local);
	}
	return rc;
}

If registration fails after at least one channel has been registered (for
example, on a subsequent channel or in dma_chan_get()), device->chancnt is
non-zero.  The open-coded cleanup loop unregisters the channels without
freeing each chan->chan_id or destroying device->chan_ida, and
device->dev_id is never freed from dma_ida.

[1] https://sashiko.dev/#/bug/linux-39bbcde3-023e-41e2-afef-7a2c13f45a17

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110101607.1378=
4-1-zhejun_huang@linux.alibaba.com?part=3D1
