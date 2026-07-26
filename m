Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3C2405EB
	for <dmaengine@vger.kernel.org>; Sun, 26 Jul 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076894; cv=none; b=RCqCjm4n60e2+QEAC9kVTct7uWOv5Gt9WwAczTvGJ2HoGagET5SjpQNbvB3Qd4A9guigdnYudn7LSN7YW8mDXTeNsSrC9XhRMc2VfguowJgx97KWYrbt6qYyQg4MYV16mLM4CqYhPAfppgUm/rhwfSd3QmZIQ4rRKk8q/Ns5Vbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076894; c=relaxed/simple;
	bh=t00CVuaIfi/20NLrKxxqW6T3Z61lbDc0EndKmd4Gzgo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nS2ZEpSYZ5zIIABlf6EiKoSdZFUtMYPHad0RZXjy4HFdubePmUlPM/R1SIUNK0N0fOpdiauEffTNck45f+DOY/A2BjfB1EFRyEX7jJp3OwhH8x4UPQIG1wAw4lzGI91Xrb0YPd454VIheHUn1ODslV15isrXZ6W0BcSOIiUuqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=kfibHhMm; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="kfibHhMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1785076892;
 bh=wxXmArkr7I9p8OzXN7Q07cbSHLBGjb9XXJaQk/wXaiQ=;
 b=kfibHhMmJyn5DtCHJNNYIZqBdSotZG15rgW2AoxpePQ68CGE2bqbvTd/MaBignuuBnl0PFQfr
 1VJjny3F3QKC96Vabp/gnc2KaBB/ilHMjT3Nr09XNgcc2DEzVidywp8mbBkED/igxV7dWP4x7De
 nQuqBpeNOQmcGd5hK4zzW2s9WlEqCwhF7n16BPDS0lJeL67qpsu20OsBVfT/1edSkHdWmJWSsh3
 XaWAuNW9l2NJfKXFhj7TXaE0/W7zgK9wYqRcfOuNAqOBL54E1eJFt2RQDXKvE9YhGtnLxm8JU/T
 tcMvN3pqTg49tQNT2WG/tBVKrxGHjeuTYYOsfieOj/og==
X-Forward-Email-ID: 6a661c98d1c8002293af8ddf
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.12.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 26 Jul 2026 10:41:27 -0400
Message-Id: <DK8KY15BK9O8.382YX2M15Q0EQ@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] dmaengine: apple-admac: Add support for M3
 generation
X-Mailer: aerc 0.21.0
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>

On Sat Jul 25, 2026 at 8:25 AM EDT, Sasha Finkelstein wrote:
> The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
> additional register writes in order to function correctly. Add a new
> compatible chain for those, and change the driver to do the write.
>
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Sasha Finkelstein (2):
>       dt-bindings: dma: apple,admac: Add M3 generation ADMACs
>       dmaengine: apple-admac: Add M3 generation ADMACs
>
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  drivers/dma/apple-admac.c                              | 32 ++++++++++++=
++++++++++++++++++--
>  2 files changed, 38 insertions(+), 4 deletions(-)
> ---
> base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
> change-id: 20260725-t603x-admac-a1b07a2ccb54
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
