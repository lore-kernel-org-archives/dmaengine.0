Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D836897D;
	Mon,  9 Mar 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042388; cv=none; b=cvSs2DlA/eG87Um8sa3vNOeXfzA3FXGOSW82N/clQ6cQ4nB78O15IteIkfYF0nHapLzkVHpiFt9PjLz1LqKIVQoqhtzyx8JBsp4xIAT2smQM2dJGQfa63+8/9VqH07B2sQ+Q7Yqzeo6+wSwPcb/EZoSOdaYvmWtUkq/vHblQVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042388; c=relaxed/simple;
	bh=iwUlxC4sI4L/1Bt81ev07M3Jllw/0mil1MXgWHdhGwM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sKTli0gpvPZvQHMHuEsfyvaa2hLWo6wOF9ksWBxHi1tj64oQWqhZQFksgyTIUpaysvR6MhDTR6FV+bIUPNbzLFkO2lXCS1f6pXx0xGSl++mgCh12PupvUQtUJrE6s767qUnYGNEhfmRlUEs8FK4laBRwywLenZzZUpNaP2oRtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Apu3b/a+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Apu3b/a+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A935C4CEF7;
	Mon,  9 Mar 2026 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042388;
	bh=iwUlxC4sI4L/1Bt81ev07M3Jllw/0mil1MXgWHdhGwM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Apu3b/a+dVdHUhfrPdcCVL105BrCwJ+D0wYJTE0ibN2b4+FF61w1wYMIeAAWMdp51
	 sDWOM3d24GXynPma/1wci55PefXmawfiGebrcOZr/VwRQjcWBpS9ua6InwgGzGINwS
	 McntL7v+mrSkhkeRFByTj6qXBjLitr7QZJKcaCyya0XQFmzQNDbs0jfjw2rn6h9V35
	 nFyBqaACd8JcT2baURjT3Jn70nMp/IQVLV2pRwc8dwc4Aer2+hVd3lf3tOIELEHQH0
	 XFd9HYtmufqxdcSOXJaYgmrp7C2GTzcwzu0eyiClPd9DhVlHHCjpgIHEEbSgVY4sns
	 B9BpnJLRfbkPA==
From: Vinod Koul <vkoul@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dmaengine: axi-dmac: Simplify with scoped for each
 OF child loop
Message-Id: <177304238675.87946.17739384709818604272.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:26 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 13:45:32 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/2] dmaengine: axi-dmac: Simplify with scoped for each OF child loop
      (no commit info)
[2/2] dmaengine: xilinx: Simplify with scoped for each OF child loop
      commit: fe8a56f098fb87dd489666d6e9d6498be73a92e6

Best regards,
-- 
~Vinod


