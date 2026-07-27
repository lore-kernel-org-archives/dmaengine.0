Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB58429CE8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187235; cv=none; b=Q80FDSKi62lEQm5U6Y2ny/K0j0cAFqKrRr2MFh0qwopdNtA5DPAamb14VMO+FMdyVB4CWyBWMKNmHTFESt8CCJPj0CFiANnGvzBgsh2h3gtGl6S2mb74I3b2N2A2lsGVtjgeeM+BCZAaxMsouAuxw3w2YIbALWV18SHg4PwZagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187235; c=relaxed/simple;
	bh=Hhh3cDaaJldgtG0dlXnKTl2GWFbpD6YIF1uwcpTfSEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJv+V/OhS651G6cUyTL33CLWHba3TzuGNdZkkZN0d14vO+bDx8GMhmpCaEsuK7f5n5UY76W9BdfHck8tnup+9PN4eSMYlFc5HhfGr8ebeHVFstbz5V3yFNlvoENhbrxDRc20GvZD26OEhTiXFXB7AGnuFDWqG0DXcZvcWdEWSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClMen0Tf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClMen0Tf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9CE1F00A3A;
	Mon, 27 Jul 2026 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187234;
	bh=RimXYlGLmh+g2dtEI+2cmW0u35/KUlE8Re2OglY4BbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ClMen0TfPOUu0XHE4+Ckz1Db5kJzjUIi4VIkbNLt6sm6IguGPARxMSiGfYyG5t67Z
	 Wl1uua6xbwW00kIO3OykSmSa4WhpjSZIe/gbxaqh2vdViiaR3EVqj+R+hSMyvL/zMB
	 xlhlsW3qfGXO7TXDCEaYVbvmk/5bzwLCV0Jvia5eCL/PLkR6CACU/uWFCi+e9Fcg0I
	 ROfqI+CwS9v1Otw/VSsuz9bg40NHX4Zpt6fGBok2abbBCVaIt5l1FiIjhXVe6YAynt
	 Be9CWJUNcYaHOZZPE+4RDyJzGapo6z5qoCnrXuvyfvWtOmXufAJ9XKppu33SyR2jM1
	 5ml26Vlna3c4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 49/64] dmaengine: hisi: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <9035b2331349a57b145796c56920ebbd7c0737ef.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <9035b2331349a57b145796c56920ebbd7c0737ef.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:20:33 +0000
Message-Id: <20260727212033.AD9CE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition during device teardown can lead to a use-after-free=
 because the bottom-half work is killed before IRQs are synchronized, allow=
ing a concurrent IRQ handler to reschedule the bottom-half work on freed me=
mory.
- [High] The driver requests shared IRQs before fully initializing virtual =
channel structures, risking an uninitialized spinlock access and null point=
er dereference if a shared or spurious interrupt occurs early.
--

--- Patch [49]: [PATCH v2 49/64] dmaengine: hisi: kill vchan BH on teardown=
 ---
commit f8a5265e01e8ff281f13c0af8c64babbb3148800
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: hisi: kill vchan BH on teardown
   =20
This commit replaces tasklet_kill() with dma_chan_kill_bh() for virt-dma=20
cleanup during device teardown.

> diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
> index 28bf818f9aa63..39bc88c465138 100644
> --- a/drivers/dma/hisi_dma.c
> +++ b/drivers/dma/hisi_dma.c
> @@ -720,7 +720,7 @@ static void hisi_dma_disable_qps(struct hisi_dma_dev =
*hdma_dev)
> =20
>  	for (i =3D 0; i < hdma_dev->chan_num; i++) {
>  		hisi_dma_disable_qp(hdma_dev, i);
> -		tasklet_kill(&hdma_dev->chan[i].vc.task);
> +		dma_chan_kill_bh(&hdma_dev->chan[i].vc.chan);

[Severity: High]
This is a pre-existing issue, but does this teardown sequence leave us open=
 to
a use-after-free regression?

During device unbind, devres executes hisi_dma_disable_hw_channels() which
calls hisi_dma_disable_qps(). However, devm_free_irq() hasn't been called y=
et.=20

If hisi_dma_irq() is concurrently executing on another CPU, it can call
vchan_cookie_complete():

drivers/dma/hisi_dma.c:hisi_dma_irq() {
	...
	vchan_cookie_complete(&desc->vd);
	...
}

This can schedule the bottom half after dma_chan_kill_bh() has already
flushed it. When devres subsequently frees the device memory, could the
scheduled bottom half execute on the freed channel structure?

>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a shared
interrupt to fire before the channel structures are fully initialized?

In hisi_dma_enable_hw_channels(), the driver requests shared IRQs before
calling hisi_dma_enable_qps(), which initializes the channels:

drivers/dma/hisi_dma.c:hisi_dma_enable_hw_channels() {
	...
	ret =3D hisi_dma_request_qps_irq(hdma_dev);
	...
}

If a shared or spurious interrupt fires immediately, hisi_dma_irq() would
execute and dereference an uninitialized pointer and lock:

drivers/dma/hisi_dma.c:hisi_dma_irq() {
	...
	struct hisi_dma_dev *hdma_dev =3D chan->hdma_dev;
	...
	spin_lock(&chan->vc.lock);
	...
}

Could this lead to a NULL pointer dereference or uninitialized lock access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D49
