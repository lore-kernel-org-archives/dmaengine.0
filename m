Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955161;
	b=0UdbPH+HjOCQDzxOS0YPd/wL1j9UfaCb3XCfl0tIjY3+Ck4dlDAucdLrI4CQ35ceWHhV
	 2eSoEhPgrAwXMQseRyqCh9l4f8nDr0KBDbDE0/M8y/MuZ6uxzF4YryKuiqoh6IEuQZrrD
	 NnWWxteRdR023/bZ1H8rKj067Q8tUjW7P4cYSPGuon15jr8vNTjLZa8l85Ed3u+/OaMYo
	 MkaNPIzzorDiIjX7cZtyRihE+sMNDxiUolX5rTZ4UFjbdLVQ+9rZarZz8pIr1d6xjVfeF
	 +wZfP7JswPia60lFrDsRL2bb1865db1P08fPDgjZJRCEI9IfZ3H0bwA7KW4o5sHxWLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955161;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MuuXBQELOv+fPGFUl6gGvL/P7JDyYcKQ9yz9ZPgh3eY=;
	b=RQlF2glOoR+dk0OejjKIJscmYw7MgufrcJqLE2E4l4OK4MlJCFYweKoyO8dmj+xUAzCf
	 sfOlHFj//kBEQzKhPxg6gldsMGos2PmUuPM6aTVdxT3X0u7+Pa77ThMOhqYGy8GqoVO/6
	 j1vnp7IX7HNAccjiVTu7JnR4rWRpS9+3tAL4G1mGL7vrOQZIbOU5bAKNblL7ijb5jVMAa
	 RuG+mHfLgY3lVLVrv1ylABx7zrBy1qYk2EmLaJ33I9BgJz0x1ozrhDcBoeiuGlhP072Gv
	 Wr88qfHjlYtEjSDuO/lRyv3H8UQI12hdvj2VEmc1OKSmuEgp5EpmaPbhiDv26AKJRcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmbSftam;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549E606A328
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmbSftam
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1711F0089F;
	Fri,  6 Nov 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955161;
	bh=MuuXBQELOv+fPGFUl6gGvL/P7JDyYcKQ9yz9ZPgh3eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mmbSftam/HEm3VGGxeb4R0C+XNTooZApCdAGSTPc+TiCEOntAeCP6PjCt+9ohAKWZ
	 c3a5V4VqXdKcQBwYB4kJjJerGXVq7T4YUYoX32J7nff7POBZ1Gn7LrnA8LCZtBqUpz
	 MLGScuvE0y/0fVd5p9vEtoKmjRorzFGjAafAsG0o/aZvX7I77ELmgPcOiRmmzJTBWT
	 Jas1idhEUSo5cmse4660ttcFp6yMTGfE1e3+YPIpDPYf/7uZCXVadNt1OH6jLKj1mb
	 T8tXyGlPdsQsuimTejrmbDZfliIWYhMT6/zzRCnYbbjatDI5krhRDmnf7rENqcVw6N
	 nLiOPCpGtTw5A==
Message-ID: <sashiko-outbox-201091@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: qcom_hidma: Fix runtime PM leak in
 hidma_issue_task()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
References: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:52:40 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: qcom_hidma: stranded descriptors and PM leak in
  hidma_issue_task()
--

commit 5c9f6221932ae0db0413c36b36c0997430c109f5
Author: Wentao Liang <vulab@iscas.ac.cn>

dmaengine: qcom_hidma: Fix runtime PM leak in hidma_issue_task()

This commit replaces pm_runtime_get_sync() with pm_runtime_resume_and_get()
in hidma_issue_task() and returns early without calling hidma_ll_start()
when runtime resume fails.

> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 1349066b1544d..c49cf622e5fb5 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -219,7 +219,8 @@ static void hidma_issue_task(struct tasklet_struct *t)
>  {
>  	struct hidma_dev *dmadev =3D from_tasklet(dmadev, t, task);
> =20
> -	pm_runtime_get_sync(dmadev->ddev.dev);
> +	if (pm_runtime_resume_and_get(dmadev->ddev.dev) < 0)
> +		return;
>  	hidma_ll_start(dmadev->lldev);
>  }

[Severity: Medium]
Does returning early here leave queued descriptors stranded on
mchan->active and still leak the runtime PM reference taken in
hidma_issue_pending()?

Before scheduling dmadev->task, hidma_issue_pending() already queues the
descriptors into dmadev->lldev and increments the runtime PM usage count:

drivers/dma/qcom/hidma.c:hidma_issue_pending() {
	spin_lock_irqsave(&mchan->lock, flags);
	list_for_each_entry_safe(qdesc, next, &mchan->queued, node) {
		hidma_ll_queue_request(dmadev->lldev, qdesc->tre_ch);
		list_move_tail(&qdesc->node, &mchan->active);
	}
	...
	/* PM will be released in hidma_callback function. */
	status =3D pm_runtime_get(dmadev->ddev.dev);
	if (status < 0)
		tasklet_schedule(&dmadev->task);
	else
		hidma_ll_start(dmadev->lldev);
}

pm_runtime_get() increments dev->power.usage_count unconditionally, even
when it returns a negative error such as -EINPROGRESS or -EACCES.

When pm_runtime_resume_and_get() fails in hidma_issue_task(), it only drops
the second reference that it took itself, leaving the reference from
pm_runtime_get() elevated.  Skipping hidma_ll_start() without aborting the
queued TREs also leaves those descriptors stuck on mchan->active and
lldev->pending_tre_list, so hidma_callback() never runs to complete the
transfers or call pm_runtime_put_autosuspend().

When pm_runtime_resume_and_get() succeeds, both hidma_issue_pending() and
hidma_issue_task() have incremented usage_count, while hidma_callback()
only drops one reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179395457228.212067=
9.13809646473624751961@iscas.ac.cn?part=3D1
