Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A739794A
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336946; cv=none; b=jNL5UT9weKSobn5knrAJDezNAO6nhb1U4hKtbhz8D3EfPSdqJQJhFVibrH3KGKHUW2j8Vwr61Lm7wmrggJysPwdLcB6FhrAaT/ugVOD7XX8T3inhpIIo8SckPhgU4rlgv6PQLAwdnXjA558Nlyo+xbEI+sGQYG4yggB0xTYc2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336946; c=relaxed/simple;
	bh=9zgQu6KVDoiQVGBOG572u3GxshRR4NqbwwQuHzBZmtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RVZuY1X70Cg4f9AtOm+HOyxZv/cSiGVko2bODwkjWr4JYGsOTqwRwXHf0EmHzgnJUQ8FqEDwukWlBsm6pwmYPmD+GgPO0YwmMk2LMkEoD0wikVL4e593iW5KO9qdgBoKo3CsUOVvXvICBW1TzK/doVZTOylciebKehANQ/tEThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My2V0nF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My2V0nF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0D21F000E9;
	Wed, 29 Jul 2026 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336945;
	bh=GSErVcWqa+tud6RnfROq2IhiHyu/Bjtbqhkzo2hBWlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=My2V0nF3et7TZYQAwHFUqEu7VlHRpey0EF3gGs1i/sq1iAW4Au4KAHaUlDrzrUgOZ
	 24wJYxrv1tT+ch33POmzXysDiIRyp9jPh6IO94cyz/v8cMu1fnHbaQ3QB9IzWn62Qs
	 CjZ0Sk+B/eFh7zb6Ni74ZS4FkDv+2dXM+X4yyw8LiglGN/Gfl1wBLw6anp9KV9eF9M
	 qF6O81HeTfi2JzNTLPgpozuQfc7YCemdduucIBnTclMSHmlu89YXwFdfbkr++XeXXh
	 xRBryj3dnmq0YDBj391AtwD7K90Enw3hExjbzeCFaQIsBPSLF33JZ/Fn1engexekLn
	 nHiRrgKmfg4tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 24/24] dmaengine: dw-edma: Add trace support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729143036.3087722-25-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-25-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:55:44 +0000
Message-Id: <20260729145545.3D0D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `edma_irq` tracepoint uses the unexported enum `DW_EDMA_LL_E=
VENT_STOP` in its `TP_printk()` format string, which breaks offline userspa=
ce trace parsing.
--

--- Patch [24]: [PATCH v4 24/24] dmaengine: dw-edma: Add trace support ---
commit 6d716b0a3b3953754ece69188d4e3a952b274f83
Author: Frank Li <Frank.Li@nxp.com>

dmaengine: dw-edma: Add trace support

This commit adds tracepoints for the circular LL ring's separate producer
and consumer positions, including LL publication, descriptor operations,
and engine recovery events. The recovery event records configured LL
channels before direction resets.

> diff --git a/drivers/dma/dw-edma/dw-edma-trace.h b/drivers/dma/dw-edma/dw=
-edma-trace.h
> new file mode 100644
> index 0000000000000..e5b3eb57df065
> --- /dev/null
> +++ b/drivers/dma/dw-edma/dw-edma-trace.h

[ ... ]

> +TRACE_EVENT(edma_irq,
> +	TP_PROTO(struct dw_edma_chan *chan,
> +		 const struct dw_edma_ll_snapshot *snapshot),
> +	TP_ARGS(chan, snapshot),

[ ... ]

> +	TP_printk("chan %u%c event %s head %u done %u total %u idx %d completed=
 %d cookie %d",
> +		  __entry->id,
> +		  __entry->dir ? 'R' : 'W',
> +		  __entry->event =3D=3D DW_EDMA_LL_EVENT_STOP ? "stop" : "progress",

[Severity: Medium]
Does using the unexported enum DW_EDMA_LL_EVENT_STOP directly in the
TP_printk format string break offline trace parsing?

When this tracepoint is exported to userspace via the events format file, t=
he
literal string DW_EDMA_LL_EVENT_STOP is included in the output.=20

Since userspace parsers like libtraceevent cannot resolve unexported kernel
C enums without TRACE_DEFINE_ENUM or __print_symbolic(), they typically fail
to evaluate the expression and may throw an error when parsing the trace da=
ta.

> +		  __entry->head,
> +		  __entry->done,
> +		  __entry->total,
> +		  __entry->index,
> +		  __entry->completed_cookie,
> +		  __entry->cookie)
> +);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D24
