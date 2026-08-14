Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB733F5BC
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 05:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684352; cv=none; b=bUAwaXSEyJZZdzN9YWEVKc0Js2vBKWrL6ehQVg0XEqiVnvnwZtEAl1NqmJoJWlcZjDZKOo+w+uniljkQIC9IdIA4UvTXwfVsMmgBhsevMK2Z3WcXDIstr3b7o7t+H23AoWn20KhICyngqDrTIz50s1ULUF4mKBAE7rEIldVjdXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684352; c=relaxed/simple;
	bh=I8hbI9zrafhvmXtSjeuBVNDDOi1FR2J1TLKit+8jGL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nAZDWhM3I4u03LS7buMLr4TjNoQ2lmZAL50CDFbOmSg3CCFzpx+dwjG8GxJRWXz0GTKI9SQrLTB8rDbj3alNragBL30eBBcxyHsvbLVZT2wj/rPqrd2ftvxhrO1KXBv2EioDpjWRKnG6CC2ymptqfWHkFmIBC4CJm4INnHwWcuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlbASAIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlbASAIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471271F000E9;
	Fri, 14 Aug 2026 05:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684350;
	bh=YHb9FHobju+T18xVqqipjMsIxrwQBBO50UL3WFSxe3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SlbASAIZ2g/e0JMD8pjtZf4SHQSVvG2p4jmnEOBtpPRxRXhORj2OSkzW/oda/DLxk
	 p3ACiMppzU/A21paIWPqIT2OLuecdfTVvJA6Y9l9JlONgOhtf0qk/4rbgtvtHyQZAy
	 g0jy16N2vjYzOBGGUQgU+Xd53UMZOxDina2pIzp3u+E4xg/rX0vgtRAiuvB0zFr6qN
	 WmpORC6R0kW+4dI4PVx0TU0b0KFFcbDSUW0sH4/+hwwwDejoDyFVgNtof9xM5jmR/w
	 5QSlUpAX2nAebI/Juns5wWBGbU9GPWgjckeScknwtMEXulrOmqit6vLXc0lNiAvp5G
	 5iLAzV8xHsMrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260814045616.1661199-5-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-5-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:12:29 +0000
Message-Id: <20260814051230.471271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition causing list corruption and double-frees in `zynqmp=
_dma_chan_desc_cleanup()` when client callbacks terminate transfers.
- [High] PM runtime usage counter leak in `zynqmp_dma_probe()` error paths.
--

--- Patch [4]: [PATCH V2 4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc co=
mments ---
commit 50bd84a068af6c47ff8d29181173cde44baa590d
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix stale kerneldoc comments

Correct kerneldoc comments that no longer matched the code.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index 22b517c570038..a2fbefbb43b65 100644
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
This is a pre-existing issue, but could there be a race condition in
zynqmp_dma_chan_desc_cleanup() if the client callback terminates the transf=
er?

When iterating over chan->done_list with list_for_each_entry_safe(), the lo=
ck
is dropped before invoking the callback:

	spin_unlock_irqrestore(&chan->lock, irqflags);
	dmaengine_desc_callback_invoke(&cb, NULL);
	spin_lock_irqsave(&chan->lock, irqflags);

If the client callback calls dmaengine_terminate_all(), it acquires the loc=
k,
empties the done_list, and moves pending descriptors to the free_list.

When zynqmp_dma_chan_desc_cleanup() resumes, it will continue iterating usi=
ng
the stale next pointer which now points into free_list. This could lead to a
double-free when zynqmp_dma_free_descriptor() is called.

[ ... ]

[Severity: High]
This is another pre-existing issue, but does zynqmp_dma_probe() leak a PM
runtime usage counter in its error paths?

If initialization fails after pm_runtime_resume_and_get(zdev->dev) succeeds,
the error path jumps to err_disable_pm:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_probe() {
    ...
err_disable_pm:
	if (!pm_runtime_enabled(zdev->dev))
		zynqmp_dma_runtime_suspend(zdev->dev);
	pm_runtime_disable(zdev->dev);
	return ret;
}

It calls pm_runtime_disable(), but it doesn't seem to call
pm_runtime_put_noidle() to drop the usage counter acquired earlier.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814045616.1661=
199-1-nagendra.golla@amd.com?part=3D4
