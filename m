Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89293B7B68
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139349; cv=none; b=R+HcrkBPTTkuRotjgpaJNDrbsLQxgnBUonr05yjhs7eJG1M/NOM1kdf3Zol+PSFOICwV40Uiyz06DBadztYwEd+JhoCTHQo0cjprEAHrciD/53RWgT9+GA/BncaLo/F2rd0mqbruuKwYFf3OTE9d5CcIv6LA/ekMteu4CdvrpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139349; c=relaxed/simple;
	bh=m+yAs6KoL8ttHycEw8bjJ2SGu+CNOgnE9p3fNf68Tdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CASifN7J/uedzdapsE6SdtfspgcbCLFRTnonII6XthMdPPIxlxdVpz4bnNq1HoxV1cZUh/iIooffEeIjkePBl7yb4WEARJQ9JXY6g6CoUmmgKacqJBpgp7CNMLzdFAhHyuBmT6MS27fYJmzuhaT9DvDa6oPgT5AAL7B8wYf1gP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgDRfYgP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgDRfYgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17431F000E9;
	Wed, 15 Jul 2026 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784139347;
	bh=pxRxPZJBP14bDzB8WKEHeP4jeqz5CU297X3U7H4E9wI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VgDRfYgP1+n8ePCzoupdWUKdyIyWvBBPG25bWmj2qNWNk0d4pVwMgExHf7LAYGPL8
	 +40TJHJ2Nn+lbMYPUXM31+z0S/Clf5neg5tqEi4Fv73TPOfaiYhCJAx3vL3GrdNH2D
	 wZFUJlytR2/QRJxynlV3dBCg7LWt8uKBAJWoa7S2iFDO7UiQ5qM+fEkDKj/YeJaRzZ
	 DyfHeXP/iwkJr+WwRA2vGSScAtxrEGaqS+3VWmv5VwxnhULPQtVn8mIRo09TEUrPen
	 TMxarqCjAytm8gHYCVaXW1kTpVEAgyCc++eihLHOy6/8IQfqL8S5ZZEX66idxSnqE8
	 e1Bzj3el01P1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] dmaengine: dw-edma: Serialize abort state
 updates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260715175740.1110404-4-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-4-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:15:46 +0000
Message-Id: <20260715181546.C17431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dw_edma_device_pause and dw_edma_device_resume modify channel stat=
e and start transfers without holding the virtual channel lock.
--

--- Patch [3]: [PATCH v3 3/9] dmaengine: dw-edma: Serialize abort state upd=
ates ---
commit 9fc733b7a8d11a99c619ff0dfa84d208446f0ab9
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Serialize abort state updates
   =20
This commit fixes a race condition in dw_edma_abort_interrupt() where dropp=
ing
the virtual channel lock before updating the channel request and status cou=
ld
cause queued descriptors to be stranded. It keeps the descriptor completion
and state transition within the same critical section.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 44ef5fbe3fd4a..272b034057469 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -740,9 +740,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_ch=
an *chan)
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
>  	}
> -	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  	chan->request =3D EDMA_REQ_NONE;
>  	chan->status =3D EDMA_ST_IDLE;
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);

[Severity: High]
This is a pre-existing issue, but since this patch fixes locking around
state updates, are dw_edma_device_pause() and dw_edma_device_resume() also
missing necessary locks?

Looking at dw_edma_device_pause(), it modifies chan->request without holding
chan->vc.lock. Similarly, dw_edma_device_resume() modifies chan->status and
invokes dw_edma_start_transfer() locklessly:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_resume() {
        ...
        } else {
                chan->status =3D EDMA_ST_BUSY;
                dw_edma_start_transfer(chan);
        }

        return err;
}

Since dw_edma_start_transfer() accesses protected lists and calls
vchan_next_desc() which expects the lock to be held
(lockdep_assert_held(&vc->lock)), could concurrent access from interrupt
handlers or issue_pending() lead to list corruption or invalid channel
states?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D3
