Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FC3D7D7E
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797898; cv=none; b=W2fuqhSbScZYgoY/q6w+T7DHcHilbQUOnIOtgLksGWR81Snf0jo9JLc3dq6LvLKU7qbbWtAqnghRCAHWxVvXhVYPpnk9wj+7+tRf3+p5ZM/HRaa0Zg2yxu92puS9W3APBYq3HCsQo6q9bI8IdFGf74sBIqCETpeXKBa+mnyrxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797898; c=relaxed/simple;
	bh=Jf8fQ2Nr7XEaBI53rX/CsrW0R49MPRhGPDCg+kHpdHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ndapXk7nA3T/shvjiKTLs9gvqi3MdTt4vFPIvv1beSMXJy4JMtvEizF5NfJX+7yaovLmg8SbZBBxugUXmwFZJjwx+eee3qMag10bYuRCLIGTK30kFJP/UMQ2+bfXIEpAq9X1G5Z7DeHWCRqXoRRehN/h2H5N3Jwvwjnw0hqLYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8lyv1QF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8lyv1QF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA191F000E9;
	Thu, 23 Jul 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784797896;
	bh=5QzJV7aK1yIF44ixjx3VIcAerVcYww+68ErNl68rHJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i8lyv1QFS24wonkgAUwoYEau+8RjPUlA58K9oXu+AR3X3EjzCJaX84l9oG2lr9mi3
	 OLBLPccMho4bSNO2Z59Z2VRrHV1KZT6dqMqKa56vLTmNB9mApkBXOZ5H5hbmSnLBWS
	 qsSCd75f0HJnAT1aPBR3nOXpaGnY77hJ0UNoOLGdXq7JdF2H0qGb9jEa2wKApZkR7V
	 CCQjA6LGAvzp45EJMQDd2tUUMN2QwYILl+VnQSMSLXdHE44PtXGTlYjknkDoBwaeb/
	 P9aQJyQiN4Oybh4yZe3ZLhLuZG9nbAxhTu4EiE+qo8S/xpebKTD+60s4ek6xTswpSO
	 19im+L+oWHWpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/19] dmaengine: dw-edma: Add trace support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-20-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-20-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:11:35 +0000
Message-Id: <20260723091136.2DA191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Data truncation of the pending elements count in engine recovery=
 tracepoint.
--

--- Patch [19]: [PATCH v2 19/19] dmaengine: dw-edma: Add trace support ---
commit 13ac2a18e4baa8bbe3759195a89d17ff4f9df2eb
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Add trace support

The circular LL ring has separate producer and consumer positions. Add
tracepoints for LL publication, descriptor append and completion,
IRQ-paired progress, and engine recovery. The common events cover eDMA
and HDMA.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 1ccd3783181ec..4b30fa5383d0a 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -647,6 +655,45 @@ dw_edma_engine_recovery_sync_irqs(struct dw_edma_eng=
ine_recovery *rec)
>  	}
>  }
> =20
> +static void
> +dw_edma_trace_engine_recovery(struct dw_edma_engine_recovery *rec)
> +{
> +	struct dw_edma *dw =3D rec->dw;
> +	u16 off =3D rec->dir =3D=3D EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
> +	u16 cnt =3D rec->dir =3D=3D EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_=
cnt;
> +	struct dw_edma_chan *chan;
> +	u16 i;
> +
> +	if (!trace_edma_engine_recovery_enabled())
> +		return;
> +
> +	for (i =3D 0; i < cnt; i++) {
> +		enum dw_edma_request request;
> +		enum dw_edma_status status;
> +		bool configured_ll;
> +		unsigned int pending;
> +		u32 ll_head, ll_done;
> +
> +		chan =3D &dw->chan[off + i];
> +		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> +			configured_ll =3D chan->configured && !chan->non_ll;
> +			if (configured_ll) {
> +				request =3D chan->request;
> +				status =3D chan->status;
> +				ll_head =3D chan->ll_head;
> +				ll_done =3D chan->ll_done;
> +				pending =3D dw_edma_ll_pending(chan);

[Severity: Medium]
Will this truncate the actual count of pending entries to 0 or 1?

Looking at dw_edma_ll_pending() in dw-edma-core.c, it is defined to return a
boolean. Assigning its result to the unsigned int pending variable means the
tracepoint will only ever record 0 or 1 instead of the true integer count of
pending items.=20

Could this use dw_edma_core_get_used_num(chan) directly to ensure the corre=
ct
statistics are logged?

> +			}
> +		}
> +		if (!configured_ll)
> +			continue;
> +
> +		trace_edma_engine_recovery(chan, dw_edma_core_ch_status(chan),
> +					   request, status, ll_head, ll_done,
> +					   pending);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D19
