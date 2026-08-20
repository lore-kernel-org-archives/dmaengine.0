Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59256442FC1;
	Thu, 20 Aug 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232759; cv=none; b=R5p9ITYNBOKPrOxbUWm0zzuZzKbsm/oOON0jC8/zIcbxbgCd6BuDy1LgpFnNdVoOTZ/z+6IpHNJW34+WYKXOgGYUs0zvEIS9RKOND8+N5L7+/QM5BIFL/BlLpZnxLSebsoLw30qQhHjYKc2W/7uZGBObBmENO9DJ6+LfXlCcQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232759; c=relaxed/simple;
	bh=NG1hw3ecPCvONhtrDJDdeRkg0L8XkE9VcTSZVunt9y0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QJkC0sz6oHwuvtNqyDjsK8+BYL9+ikFfnLo7Ibq1f3YoEOPkyqoCOFf0Sf8iwJ5F6+udne/tUBTPTByhU6h8Tw6+GiZA+V0M2n6MVZWwySD4FxxnoLf17JrwJsRm9XGHh3izivzGQPJCXHPaOvyoxdLFIlOVwnE5LuI4hBN0txU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=g2EopXvT; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="g2EopXvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787232744; x=1787837544; i=markus.elfring@web.de;
	bh=VQYAlkKbayx6GriHkHj0SmbptSgllJGpjWY9gdeSRlY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=g2EopXvTn2a19qhRT/Cl6gb/TFGLhQVq8vIaabKzsV90h0UQoVvCQFekmssfgU7P
	 YSOKRjvuXZYkwopYd6uwF2wB9X5FJKlslrzpRIepFUNJzjqfcn9RXp+zORFDeexZJ
	 VdXbfkAbdEUlTXOp9bGRg3t+5YsWwWoPMH/tCWEnfT2xl0TNNspdrG9yy2V8w7YcL
	 dYDLQXPgEAp3y/LXnMSQgfN2/xDuGt0vBWnz0hsnLxzCwxfROkVkjGnUWR/Kzz4js
	 ku1UusrfBJPVKFG7XA66VngeZHW92W1mx9/R3m8fYHmf0aoHa52laHXyXqL1YGdYh
	 1rKdRPfgdjub/mCllw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ell-1x2Iby3HWn-00EPe7; Thu, 20
 Aug 2026 15:32:23 +0200
Message-ID: <f2beef49-1eff-466f-bbf8-2d701ade2f54@web.de>
Date: Thu, 20 Aug 2026 15:32:21 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20260817201200.10952-1-rosenp@gmail.com>
Subject: Re: [PATCH v3] dmaengine: at_hdmac: use devm APIs in probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mhftijn+W6w8U7SKO8UN++w3p8eY7PL6gZ3MfM2nZLEhvfzIf5H
 xTOI3f5+AZVTZUPERLBfdisJDdPHcOYKu5Jv+Gx/Xts4LDbdhFEYzcgNdHF7Op7ihsY4pAo
 gFnfzkm16CPV10Fu1qsvp30nAEulIm4CTLV/5S/MXeb/YF3dJJQQ0d6RcJjqkLI4UceeRo1
 YZ/nqn862S7vSI8ZAWb1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FsFEf1LVsdQ=;TKmOFsN2zMFbITAj1n/ipMN6qw0
 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
 u+W6pdWxJOP5TCoaA==

=E2=80=A6
> Simplify the error handling path and removes explicit cleanup code.

                                       remove?

Would it be helpful to mention at_dma_probe() in the summary phrase?

Regards,
Markus
