Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521160;
	b=vZ8cEohSpt1G+yRODBR5N6rBtncC6IKcMxjKgfTRa88vqQea2CHxFfAV8NtyrJ/eFZyn
	 9rOY7nNuG10Wuz0SAL284kUUM6nb3DUvjVs70UzugPzZnoW4C1NLOeotQADnn4cvcGHJB
	 ahD8VoHLOEu8f6AJvBtHrNiB3l9P562hSFtX8XHceX1XIhTP/r4bizkkbFztv4ai67N71
	 uwyakXIklrZGJ7ibgnM4suUcdMJHd9rx+Ma+5SzQ7OnHSHSXP+Ctwh8gfyxrQbe6PwBQa
	 FfHO5ol3rtr7VVMbHDu0HY+zGnjuNrDNT/Qu1/XvFHObu/WtT0ii2QYpjsk0dvdklwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qk4tA5VsxTmxJpEW4riEV7fAVIfxaT60CND0D8aWTm4=;
	b=0Bg7MH4bUX9Eos2zRo2TjxNVw/WkbajnXebqGXqaEn36D6dGE9zblciGeHYxh9E/lcU7
	 YVnbvP2GpfgQJiU8HIqmEI1FNEDiIcvcu3hVQIcphtKcAI7C3LqSRLMUQpFGqUqXp8675
	 yGNF5H+noXKF9l7PoHNI78PHkkV1dHQjFl3lr/MXo8/3o2Rt25joNUMjzechAeN9HZpb4
	 mvQZh43zErqxChS6EfkrFKEhrg+90BKSaxBa2x2D6Az2Z9+BwVrwwBxEVdjOrFl55DAMC
	 7a3lP/3LDjtgKa8beh92zWouGQtH1kahaIU+F6LSHkZVTRPVSIRw6hetToZFXwtBxaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtT69ZS0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320B606A31E;
	Tue, 24 Nov 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtT69ZS0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C294A1F000CF;
	Tue, 24 Nov 2026 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521159;
	bh=Qk4tA5VsxTmxJpEW4riEV7fAVIfxaT60CND0D8aWTm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtT69ZS09eUfOId81JeLrXdZv7sf96Kxtu78x47oFXsCS1C5VhZa37QbQfH6FA0L8
	 BuFEN/dmuJalbjo1bQmNO9ndCmcxN6fUOuq4L4eY7QFwxRtItrHu4NLJzDUqwnTlsl
	 jT/5q3926/RDBR4T1uoxqd5L+o4OHO4QU5dIvw0nvCQxkV6zUTdCvT/9z2V5pca824
	 z9azyZNqoTeu49nJdkshAlKuYnJEpmPvT6uZQaf+VyM85hd+WKpAWZASXFsT6NbRCs
	 vEfCOBgtPuNDcjgg06jwdEAGjI3gjVQYT/BtyCwHu+2+M7qsOMXZzkeG6bU+U0UvX9
	 md9o4rYVQuULg==
Message-ID: <sashiko-outbox-231079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/20] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-1-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-1-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:52:38 +0000
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
- [Low] dmaengine: ti: k3-udma: invalid Fixes tag and crash title on
  preparatory patch
--

commit 36b08f1944cb056ef76580b3ee0e9efaba830d4b
Author: Vignesh Raghavendra <vigneshr@ti.com>

> dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
>
> ring_init_data is declared on stack and left uninitialized, so any
> field not explicitly assigned afterwards carries garbage. Every field
> that exists on struct k3_ringacc_init_data today (tisci, tisci_dev_id,
> num_rings) is set immediately below, so this is currently a no-op, but
> a later patch in this series adds a base_rt field to the same struct
> that is not set by this call site. Without this fix, that field would
> carry stack garbage here, and k3_ringacc_dmarings_init() could use a
> junk address for the ringrt base, causing a crash during ring pop:
>
> [    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-=
selector
> [    2.532106] Unable to handle kernel paging request at virtual address =
ffff800081a84b98
> [    2.540051] Mem abort info:
> [...]
> [    2.629987] Workqueue: events_unbound deferred_probe_work_func
> [    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
> [    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
> [...]
> [    2.726250] Call trace:
> [    2.728691]  k3_ringacc_ring_pop+0x48/0x94
> [    2.732786]  udma_ring_irq_handler+0x34/0x218
> [    2.737141]  __handle_irq_event_percpu+0x60/0x14c
> [    2.741846]  handle_irq_event+0x4c/0xa8
>
> Fix this proactively by explicitly initializing the variable to 0,
> before the base_rt field is introduced.
>
> Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDM=
A")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>

[Severity: Low]
Should the Fixes: tag be dropped and the subject updated to reflect that
this is a preparatory patch?

Commit 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
initialized every field of struct k3_ringacc_init_data (tisci, tisci_dev_id,
and num_rings) in udma_probe(), so zero-initializing ring_init_data is a
no-op prior to the later commit "drivers: soc: ti: k3-ringacc: handle
absence of tisci" in this series adding base_rt.  Keeping the Fixes: tag and
crash subject will cause stable automation to backport a no-op change to
stable trees back to v5.11.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D1
