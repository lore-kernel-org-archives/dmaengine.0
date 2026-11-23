Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431755;
	b=PupxEpOrzEfmrE7ER76TIL+Llxhb0A8Ckk3iKCJKZR+CSLfMVJ2tjeKbVzhQkFjMbsPL
	 Etzdx83fxrPCTSWDXxGae8lpNCLDi8bEYcRQ5XaFUaPKTK1XmxvgXRH01oshXfJ0eDNB+
	 6IwQQAWrmEoD4PsyfdODWOWm4Unlbm1xhv/PumGSv5EwrVnw8WMq5gPqW+YUtg/dhx6Du
	 gRiXrxfkku5Ep1HXw4e1GJmHgR9z7vEyYnTA1PpgQIW/00Hk76YD9uQZmuLWJpT42wtWy
	 sgE+lmNDxb7r31WBhVVP0OdYtHBg1WBl8as+ATkdYBnsZP0uWVz1mBE78Irnx4CfC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431755;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UlzfcXh+CNnxF1/O6sGZNDQpzwhENM9AgD1sdDiZQ0E=;
	b=hnvpqMVWsNtlrdsmpzYuVSOWxQbOmKG6BfezSCjJ2u6zsMMQUgbpxyRCXwxojUvTX8Qd
	 2R8M0cGXd90c3deIu2BN/O9oSbu+6HuDpjMunT8JeN7br3gUlXFf6GGp+cJaR0I2Jf5W/
	 foYsJYGg3SjAyRz27UElVdjVz64d4qOB7GKvRNO3ndrjM14nICLGadzl9jqQg405Sit6S
	 6RtpyD53qup2OnR7nlibPF1dU2MixzHcvHZ2lcgeRBYMn5U7m+Wv4+i3CVJ9H5kYPR8Iq
	 ttkFWC/1FJTuO7FumoWiyj0yPfsVkj3pVl/nH27CMZxvnzEGOO/AUS9HibZeDZYNdlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ2ti56H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EE606A32C;
	Mon, 23 Nov 2026 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ2ti56H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409FB1F000C6;
	Mon, 23 Nov 2026 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431754;
	bh=UlzfcXh+CNnxF1/O6sGZNDQpzwhENM9AgD1sdDiZQ0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lQ2ti56HgOLvZQ+snX0qzWOH5X+4cz5JgkTnMpOFB2yLxXsl5Wm3BHMQKwQlBvKZh
	 odc+Xg8v4PoUrHvbGH9J/9w55VbUP1oiRuoahUTNIZDspgiEo0xXPxe9GD5oX2tRhu
	 FxtAz1ZAFWwj8DMNesbqXFvnLu4Aw3XITh8IpI7rlWhxQbubyW6tByt6Mi3BGOVSwQ
	 wWWlN/q5y+GS2TSkG6w9uOKQXl2f07+AQxQEzEVfDP7FYfOoGupmJxxfErczBhJd28
	 qc38rnwyOEkntRjyNb8DlTrmLZPr7gZBqyzSLEOHdgS+XJ62QXZhA76KG5yXg5P6RU
	 7qrZi5m8+e2ag==
Message-ID: <296b2280-f825-446b-b128-f37bc41f1eb3@kernel.org>
Date: Mon, 23 Nov 2026 12:02:30 +0100
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] dmaengine: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Frank Li <Frank.li@oss.nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Frank Li <Frank.Li@kernel.org>, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261030145901.1393-1-crofts@kernel.org>
 <auS_PrwhMwhc5BNk@SMW015318>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <auS_PrwhMwhc5BNk@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30-Oct-26 17:01, Frank Li wrote:
> On Fri, Oct 30, 2026 at 02:58:58PM +0000, Joshua Crofts wrote:
>> [You don't often get email from crofts@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
>> driver core is now responsible for undoing any
>> pm_runtime_use_autosuspend() calls on driver exit.
>>
>> Remove the redundant function calls.
>>
>> Joshua Crofts (3):
>>   dmaengine: at_xdmac: remove redundant
>>     pm_runtime_dont_use_autosuspend() calls
>>   dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
>>     calls
>>   dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
>>     calls
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>>  drivers/dma/at_xdmac.c     | 2 --
>>  drivers/dma/qcom/bam_dma.c | 1 -
>>  drivers/dma/ti/cppi41.c    | 5 +----
>>  3 files changed, 1 insertion(+), 7 deletions(-)
>>
>>
>> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
>> --
>> 2.47.3
>>

Hi, gentle ping on this series!

-- 
Kind regards,
Joshua Crofts
